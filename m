Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580F7D3ABB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 17:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0246210E1E4;
	Mon, 23 Oct 2023 15:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B93A10E1E4;
 Mon, 23 Oct 2023 15:29:26 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1dd8304b980so2489730fac.2; 
 Mon, 23 Oct 2023 08:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698074964; x=1698679764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xrSeT0XNopX9hAG53lJVCqAjvRaYnSJ98UQFC5Cfo+s=;
 b=QJhl+z92YnoUi3+FrHTh9Gb+lie87uMuOCUDAQQVxyEWBKGiMcoxFRWJYMXBkwCU6i
 4F7X+LLcHGmEzN8kYwI5y7yMpaDeD6RsIvKIpgu29w1OMxIRPZ9owS2chH4xhSiS++bA
 hp0+Fux7GVDdrj2/gWWQwqL2raJGgL45eBkzcg4PsCkBUCQbx+mFThKVpEJeQasFFJTZ
 NiTFJ6rlpVj24+jnrJJxL/Gzlcem6G8YBMZV+I7M9G6yvVoJsbtrSrPSMHwjH2PmfDw7
 T2FLnoPAevs9HP/GFqesbDS2cxTqEK+FvcU4z9KrDL6hUqryb2LvazhV3hvUb1Co+bVT
 SjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698074964; x=1698679764;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xrSeT0XNopX9hAG53lJVCqAjvRaYnSJ98UQFC5Cfo+s=;
 b=B2uiJTZL4tzhS8PfAUOPWNFxMux69ySKDZ+xLhAuBA3IRb+kK9ILqtoUVKoJegMvyF
 7cA8knvc7QMFM+QKJU+qVZ8LyIDh7wCiOnAMbT1HLQ1MWKmEqgsB5M7swGA7IuTsRXkU
 NRO35F87khr87GjIink9lO9a/U8uVQTA7za/+Gs04JNPD3oMXH19qN7d5ciGOwyrkRxy
 vfEWV0W4+x6iVJTViLnL78TWfng58NIIQxvBzRPWONO4prENn7tRFzqC0ipc5lt2pY6i
 hgfny7Skt3ivIAOykpksZiIS5NVXXN/4vSTY1qWRSB3eI5BDKqT0QxdgmyBqTf2yeAGp
 bF7w==
X-Gm-Message-State: AOJu0Yxa65W9cbox9PhGEIji9Y76a9lA9n/4rCOfMvJUesynyiUmAerM
 eX4osdH1EwmlpHAAfpMXxrMCmcCALW3B+geJaq8=
X-Google-Smtp-Source: AGHT+IFqQ4+y85W4MFqhZQ6Z1LlILvYxxXclMtfVnBvkrlxoLLKvMUS6AKuBsXOOCnV7yKslbg1ZsJDMs8w4eSzz4O4=
X-Received: by 2002:a05:6870:6ec9:b0:1ea:1667:6c8f with SMTP id
 qv9-20020a0568706ec900b001ea16676c8fmr12123620oab.50.1698074964213; Mon, 23
 Oct 2023 08:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Oct 2023 11:29:12 -0400
Message-ID: <CADnq5_PLfTg6hBpSHLND9FF-B++D=BMXQKSJQknOxy8y=Qz-ZA@mail.gmail.com>
Subject: Re: [RFC v4 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: ogabbay@kernel.org, Harish.Kasiviswanathan@amd.com,
 dri-devel@lists.freedesktop.org, michael.j.ruhl@intel.com,
 Luben.Tuikov@amd.com, ttayar@habana.ai, alexander.deucher@amd.com,
 Felix.Kuehling@amd.com, intel-xe@lists.freedesktop.org, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 20, 2023 at 7:42=E2=80=AFPM Aravind Iddamsetty
<aravind.iddamsetty@linux.intel.com> wrote:
>
> Our hardware supports RAS(Reliability, Availability, Serviceability) by
> reporting the errors to the host, which the KMD processes and exposes a
> set of error counters which can be used by observability tools to take
> corrective actions or repairs. Traditionally there were being exposed
> via PMU (for relative counters) and sysfs interface (for absolute
> value) in our internal branch. But, due to the limitations in this
> approach to use two interfaces and also not able to have an event based
> reporting or configurability, an alternative approach to try netlink
> was suggested by community for drm subsystem wide UAPI for RAS and
> telemetry as discussed in [1].
>
> This [1] is the inspiration to this series. It uses the generic
> netlink(genl) family subsystem and exposes a set of commands that can
> be used by every drm driver, the framework provides a means to have
> custom commands too. Each drm driver instance in this example xe driver
> instance registers a family and operations to the genl subsystem through
> which it enumerates and reports the error counters. An event based
> notification is also supported to which userpace can subscribe to and
> be notified when any error occurs and read the error counter this avoids
> continuous polling on error counter. This can also be extended to
> threshold based notification.

@Hawking Zhang, @Lazar, Lijo

Can you take a look at this series and API and see if it would align
with our RAS requirements going forward?

Alex


>
> [1]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summa=
ry.html
>
> this series is on top of https://patchwork.freedesktop.org/series/125373/=
,
>
> v4:
> 1. Rebase
> 2. rename drm_genl_send to drm_genl_reply
> 3. catch error from xa_store and handle appropriately
> 4. presently xe_list_errors fills blank data for IGFX, prevent it by
> having an early check of IS_DGFX (Michael J. Ruhl)
>
> v3:
> 1. Rebase on latest RAS series for XE
> 2. drop DRIVER_NETLINK flag and use the driver_genl_ops structure to
> register to netlink subsystem
>
> v2: define common interfaces to genl netlink subsystem that all drm drive=
rs
> can leverage.
>
> Below is an example tool drm_ras which demonstrates the use of the
> supported commands. The tool will be sent to ML with the subject
> "[RFC i-g-t v2 0/1] A tool to demonstrate use of netlink sockets to read =
RAS error counters"
> https://patchwork.freedesktop.org/series/118437/#rev2
>
> read single error counter:
>
> $ ./drm_ras READ_ONE --device=3Ddrm:/dev/dri/card1 --error_id=3D0x0000000=
000000005
> counter value 0
>
> read all error counters:
>
> $ ./drm_ras READ_ALL --device=3Ddrm:/dev/dri/card1
> name                                                    config-id        =
       counter
>
> error-gt0-correctable-guc                               0x000000000000000=
1      0
> error-gt0-correctable-slm                               0x000000000000000=
3      0
> error-gt0-correctable-eu-ic                             0x000000000000000=
4      0
> error-gt0-correctable-eu-grf                            0x000000000000000=
5      0
> error-gt0-fatal-guc                                     0x000000000000000=
9      0
> error-gt0-fatal-slm                                     0x000000000000000=
d      0
> error-gt0-fatal-eu-grf                                  0x000000000000000=
f      0
> error-gt0-fatal-fpu                                     0x000000000000001=
0      0
> error-gt0-fatal-tlb                                     0x000000000000001=
1      0
> error-gt0-fatal-l3-fabric                               0x000000000000001=
2      0
> error-gt0-correctable-subslice                          0x000000000000001=
3      0
> error-gt0-correctable-l3bank                            0x000000000000001=
4      0
> error-gt0-fatal-subslice                                0x000000000000001=
5      0
> error-gt0-fatal-l3bank                                  0x000000000000001=
6      0
> error-gt0-sgunit-correctable                            0x000000000000001=
7      0
> error-gt0-sgunit-nonfatal                               0x000000000000001=
8      0
> error-gt0-sgunit-fatal                                  0x000000000000001=
9      0
> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001=
a      0
> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001=
b      0
> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001=
c      0
> error-gt0-soc-fatal-punit                               0x000000000000001=
d      0
> error-gt0-soc-fatal-psf-0                               0x000000000000001=
e      0
> error-gt0-soc-fatal-psf-1                               0x000000000000001=
f      0
> error-gt0-soc-fatal-psf-2                               0x000000000000002=
0      0
> error-gt0-soc-fatal-cd0                                 0x000000000000002=
1      0
> error-gt0-soc-fatal-cd0-mdfi                            0x000000000000002=
2      0
> error-gt0-soc-fatal-mdfi-east                           0x000000000000002=
3      0
> error-gt0-soc-fatal-mdfi-south                          0x000000000000002=
4      0
> error-gt0-soc-fatal-hbm-ss0-0                           0x000000000000002=
5      0
> error-gt0-soc-fatal-hbm-ss0-1                           0x000000000000002=
6      0
> error-gt0-soc-fatal-hbm-ss0-2                           0x000000000000002=
7      0
> error-gt0-soc-fatal-hbm-ss0-3                           0x000000000000002=
8      0
> error-gt0-soc-fatal-hbm-ss0-4                           0x000000000000002=
9      0
> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002=
a      0
> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002=
b      0
> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002=
c      0
> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002=
d      0
> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002=
e      0
> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002=
f      0
> error-gt0-soc-fatal-hbm-ss1-3                           0x000000000000003=
0      0
> error-gt0-soc-fatal-hbm-ss1-4                           0x000000000000003=
1      0
> error-gt0-soc-fatal-hbm-ss1-5                           0x000000000000003=
2      0
> error-gt0-soc-fatal-hbm-ss1-6                           0x000000000000003=
3      0
> error-gt0-soc-fatal-hbm-ss1-7                           0x000000000000003=
4      0
> error-gt0-soc-fatal-hbm-ss2-0                           0x000000000000003=
5      0
> error-gt0-soc-fatal-hbm-ss2-1                           0x000000000000003=
6      0
> error-gt0-soc-fatal-hbm-ss2-2                           0x000000000000003=
7      0
> error-gt0-soc-fatal-hbm-ss2-3                           0x000000000000003=
8      0
> error-gt0-soc-fatal-hbm-ss2-4                           0x000000000000003=
9      0
> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003=
a      0
> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003=
b      0
> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003=
c      0
> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003=
d      0
> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003=
e      0
> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003=
f      0
> error-gt0-soc-fatal-hbm-ss3-3                           0x000000000000004=
0      0
> error-gt0-soc-fatal-hbm-ss3-4                           0x000000000000004=
1      0
> error-gt0-soc-fatal-hbm-ss3-5                           0x000000000000004=
2      0
> error-gt0-soc-fatal-hbm-ss3-6                           0x000000000000004=
3      0
> error-gt0-soc-fatal-hbm-ss3-7                           0x000000000000004=
4      0
> error-gt0-gsc-correctable-sram-ecc                      0x000000000000004=
5      0
> error-gt0-gsc-nonfatal-mia-shutdown                     0x000000000000004=
6      0
> error-gt0-gsc-nonfatal-mia-int                          0x000000000000004=
7      0
> error-gt0-gsc-nonfatal-sram-ecc                         0x000000000000004=
8      0
> error-gt0-gsc-nonfatal-wdg-timeout                      0x000000000000004=
9      0
> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004=
a      0
> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004=
b      0
> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004=
c      0
> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004=
d      0
> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004=
e      0
> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004=
f      0
> error-gt0-gsc-nonfatal-aon-parity                       0x000000000000005=
0      0
> error-gt1-correctable-guc                               0x100000000000000=
1      0
> error-gt1-correctable-slm                               0x100000000000000=
3      0
> error-gt1-correctable-eu-ic                             0x100000000000000=
4      0
> error-gt1-correctable-eu-grf                            0x100000000000000=
5      0
> error-gt1-fatal-guc                                     0x100000000000000=
9      0
> error-gt1-fatal-slm                                     0x100000000000000=
d      0
> error-gt1-fatal-eu-grf                                  0x100000000000000=
f      0
> error-gt1-fatal-fpu                                     0x100000000000001=
0      0
> error-gt1-fatal-tlb                                     0x100000000000001=
1      0
> error-gt1-fatal-l3-fabric                               0x100000000000001=
2      0
> error-gt1-correctable-subslice                          0x100000000000001=
3      0
> error-gt1-correctable-l3bank                            0x100000000000001=
4      0
> error-gt1-fatal-subslice                                0x100000000000001=
5      0
> error-gt1-fatal-l3bank                                  0x100000000000001=
6      0
> error-gt1-sgunit-correctable                            0x100000000000001=
7      0
> error-gt1-sgunit-nonfatal                               0x100000000000001=
8      0
> error-gt1-sgunit-fatal                                  0x100000000000001=
9      0
> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001=
a      0
> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001=
b      0
> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001=
c      0
> error-gt1-soc-fatal-punit                               0x100000000000001=
d      0
> error-gt1-soc-fatal-psf-0                               0x100000000000001=
e      0
> error-gt1-soc-fatal-psf-1                               0x100000000000001=
f      0
> error-gt1-soc-fatal-psf-2                               0x100000000000002=
0      0
> error-gt1-soc-fatal-cd0                                 0x100000000000002=
1      0
> error-gt1-soc-fatal-cd0-mdfi                            0x100000000000002=
2      0
> error-gt1-soc-fatal-mdfi-east                           0x100000000000002=
3      0
> error-gt1-soc-fatal-mdfi-south                          0x100000000000002=
4      0
> error-gt1-soc-fatal-hbm-ss0-0                           0x100000000000002=
5      0
> error-gt1-soc-fatal-hbm-ss0-1                           0x100000000000002=
6      0
> error-gt1-soc-fatal-hbm-ss0-2                           0x100000000000002=
7      0
> error-gt1-soc-fatal-hbm-ss0-3                           0x100000000000002=
8      0
> error-gt1-soc-fatal-hbm-ss0-4                           0x100000000000002=
9      0
> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002=
a      0
> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002=
b      0
> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002=
c      0
> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002=
d      0
> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002=
e      0
> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002=
f      0
> error-gt1-soc-fatal-hbm-ss1-3                           0x100000000000003=
0      0
> error-gt1-soc-fatal-hbm-ss1-4                           0x100000000000003=
1      0
> error-gt1-soc-fatal-hbm-ss1-5                           0x100000000000003=
2      0
> error-gt1-soc-fatal-hbm-ss1-6                           0x100000000000003=
3      0
> error-gt1-soc-fatal-hbm-ss1-7                           0x100000000000003=
4      0
> error-gt1-soc-fatal-hbm-ss2-0                           0x100000000000003=
5      0
> error-gt1-soc-fatal-hbm-ss2-1                           0x100000000000003=
6      0
> error-gt1-soc-fatal-hbm-ss2-2                           0x100000000000003=
7      0
> error-gt1-soc-fatal-hbm-ss2-3                           0x100000000000003=
8      0
> error-gt1-soc-fatal-hbm-ss2-4                           0x100000000000003=
9      0
> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003=
a      0
> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003=
b      0
> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003=
c      0
> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003=
d      0
> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003=
e      0
> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003=
f      0
> error-gt1-soc-fatal-hbm-ss3-3                           0x100000000000004=
0      0
> error-gt1-soc-fatal-hbm-ss3-4                           0x100000000000004=
1      0
> error-gt1-soc-fatal-hbm-ss3-5                           0x100000000000004=
2      0
> error-gt1-soc-fatal-hbm-ss3-6                           0x100000000000004=
3      0
> error-gt1-soc-fatal-hbm-ss3-7                           0x100000000000004=
4      0
>
> wait on a error event:
>
> $ ./drm_ras WAIT_ON_EVENT --device=3Ddrm:/dev/dri/card1
> waiting for error event
> error event received
> counter value 0
>
> list all errors:
>
> $ ./drm_ras LIST_ERRORS --device=3Ddrm:/dev/dri/card1
> name                                                    config-id
>
> error-gt0-correctable-guc                               0x000000000000000=
1
> error-gt0-correctable-slm                               0x000000000000000=
3
> error-gt0-correctable-eu-ic                             0x000000000000000=
4
> error-gt0-correctable-eu-grf                            0x000000000000000=
5
> error-gt0-fatal-guc                                     0x000000000000000=
9
> error-gt0-fatal-slm                                     0x000000000000000=
d
> error-gt0-fatal-eu-grf                                  0x000000000000000=
f
> error-gt0-fatal-fpu                                     0x000000000000001=
0
> error-gt0-fatal-tlb                                     0x000000000000001=
1
> error-gt0-fatal-l3-fabric                               0x000000000000001=
2
> error-gt0-correctable-subslice                          0x000000000000001=
3
> error-gt0-correctable-l3bank                            0x000000000000001=
4
> error-gt0-fatal-subslice                                0x000000000000001=
5
> error-gt0-fatal-l3bank                                  0x000000000000001=
6
> error-gt0-sgunit-correctable                            0x000000000000001=
7
> error-gt0-sgunit-nonfatal                               0x000000000000001=
8
> error-gt0-sgunit-fatal                                  0x000000000000001=
9
> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001=
a
> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001=
b
> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001=
c
> error-gt0-soc-fatal-punit                               0x000000000000001=
d
> error-gt0-soc-fatal-psf-0                               0x000000000000001=
e
> error-gt0-soc-fatal-psf-1                               0x000000000000001=
f
> error-gt0-soc-fatal-psf-2                               0x000000000000002=
0
> error-gt0-soc-fatal-cd0                                 0x000000000000002=
1
> error-gt0-soc-fatal-cd0-mdfi                            0x000000000000002=
2
> error-gt0-soc-fatal-mdfi-east                           0x000000000000002=
3
> error-gt0-soc-fatal-mdfi-south                          0x000000000000002=
4
> error-gt0-soc-fatal-hbm-ss0-0                           0x000000000000002=
5
> error-gt0-soc-fatal-hbm-ss0-1                           0x000000000000002=
6
> error-gt0-soc-fatal-hbm-ss0-2                           0x000000000000002=
7
> error-gt0-soc-fatal-hbm-ss0-3                           0x000000000000002=
8
> error-gt0-soc-fatal-hbm-ss0-4                           0x000000000000002=
9
> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002=
a
> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002=
b
> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002=
c
> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002=
d
> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002=
e
> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002=
f
> error-gt0-soc-fatal-hbm-ss1-3                           0x000000000000003=
0
> error-gt0-soc-fatal-hbm-ss1-4                           0x000000000000003=
1
> error-gt0-soc-fatal-hbm-ss1-5                           0x000000000000003=
2
> error-gt0-soc-fatal-hbm-ss1-6                           0x000000000000003=
3
> error-gt0-soc-fatal-hbm-ss1-7                           0x000000000000003=
4
> error-gt0-soc-fatal-hbm-ss2-0                           0x000000000000003=
5
> error-gt0-soc-fatal-hbm-ss2-1                           0x000000000000003=
6
> error-gt0-soc-fatal-hbm-ss2-2                           0x000000000000003=
7
> error-gt0-soc-fatal-hbm-ss2-3                           0x000000000000003=
8
> error-gt0-soc-fatal-hbm-ss2-4                           0x000000000000003=
9
> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003=
a
> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003=
b
> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003=
c
> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003=
d
> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003=
e
> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003=
f
> error-gt0-soc-fatal-hbm-ss3-3                           0x000000000000004=
0
> error-gt0-soc-fatal-hbm-ss3-4                           0x000000000000004=
1
> error-gt0-soc-fatal-hbm-ss3-5                           0x000000000000004=
2
> error-gt0-soc-fatal-hbm-ss3-6                           0x000000000000004=
3
> error-gt0-soc-fatal-hbm-ss3-7                           0x000000000000004=
4
> error-gt0-gsc-correctable-sram-ecc                      0x000000000000004=
5
> error-gt0-gsc-nonfatal-mia-shutdown                     0x000000000000004=
6
> error-gt0-gsc-nonfatal-mia-int                          0x000000000000004=
7
> error-gt0-gsc-nonfatal-sram-ecc                         0x000000000000004=
8
> error-gt0-gsc-nonfatal-wdg-timeout                      0x000000000000004=
9
> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004=
a
> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004=
b
> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004=
c
> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004=
d
> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004=
e
> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004=
f
> error-gt0-gsc-nonfatal-aon-parity                       0x000000000000005=
0
> error-gt1-correctable-guc                               0x100000000000000=
1
> error-gt1-correctable-slm                               0x100000000000000=
3
> error-gt1-correctable-eu-ic                             0x100000000000000=
4
> error-gt1-correctable-eu-grf                            0x100000000000000=
5
> error-gt1-fatal-guc                                     0x100000000000000=
9
> error-gt1-fatal-slm                                     0x100000000000000=
d
> error-gt1-fatal-eu-grf                                  0x100000000000000=
f
> error-gt1-fatal-fpu                                     0x100000000000001=
0
> error-gt1-fatal-tlb                                     0x100000000000001=
1
> error-gt1-fatal-l3-fabric                               0x100000000000001=
2
> error-gt1-correctable-subslice                          0x100000000000001=
3
> error-gt1-correctable-l3bank                            0x100000000000001=
4
> error-gt1-fatal-subslice                                0x100000000000001=
5
> error-gt1-fatal-l3bank                                  0x100000000000001=
6
> error-gt1-sgunit-correctable                            0x100000000000001=
7
> error-gt1-sgunit-nonfatal                               0x100000000000001=
8
> error-gt1-sgunit-fatal                                  0x100000000000001=
9
> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001=
a
> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001=
b
> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001=
c
> error-gt1-soc-fatal-punit                               0x100000000000001=
d
> error-gt1-soc-fatal-psf-0                               0x100000000000001=
e
> error-gt1-soc-fatal-psf-1                               0x100000000000001=
f
> error-gt1-soc-fatal-psf-2                               0x100000000000002=
0
> error-gt1-soc-fatal-cd0                                 0x100000000000002=
1
> error-gt1-soc-fatal-cd0-mdfi                            0x100000000000002=
2
> error-gt1-soc-fatal-mdfi-east                           0x100000000000002=
3
> error-gt1-soc-fatal-mdfi-south                          0x100000000000002=
4
> error-gt1-soc-fatal-hbm-ss0-0                           0x100000000000002=
5
> error-gt1-soc-fatal-hbm-ss0-1                           0x100000000000002=
6
> error-gt1-soc-fatal-hbm-ss0-2                           0x100000000000002=
7
> error-gt1-soc-fatal-hbm-ss0-3                           0x100000000000002=
8
> error-gt1-soc-fatal-hbm-ss0-4                           0x100000000000002=
9
> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002=
a
> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002=
b
> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002=
c
> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002=
d
> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002=
e
> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002=
f
> error-gt1-soc-fatal-hbm-ss1-3                           0x100000000000003=
0
> error-gt1-soc-fatal-hbm-ss1-4                           0x100000000000003=
1
> error-gt1-soc-fatal-hbm-ss1-5                           0x100000000000003=
2
> error-gt1-soc-fatal-hbm-ss1-6                           0x100000000000003=
3
> error-gt1-soc-fatal-hbm-ss1-7                           0x100000000000003=
4
> error-gt1-soc-fatal-hbm-ss2-0                           0x100000000000003=
5
> error-gt1-soc-fatal-hbm-ss2-1                           0x100000000000003=
6
> error-gt1-soc-fatal-hbm-ss2-2                           0x100000000000003=
7
> error-gt1-soc-fatal-hbm-ss2-3                           0x100000000000003=
8
> error-gt1-soc-fatal-hbm-ss2-4                           0x100000000000003=
9
> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003=
a
> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003=
b
> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003=
c
> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003=
d
> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003=
e
> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003=
f
> error-gt1-soc-fatal-hbm-ss3-3                           0x100000000000004=
0
> error-gt1-soc-fatal-hbm-ss3-4                           0x100000000000004=
1
> error-gt1-soc-fatal-hbm-ss3-5                           0x100000000000004=
2
> error-gt1-soc-fatal-hbm-ss3-6                           0x100000000000004=
3
> error-gt1-soc-fatal-hbm-ss3-7                           0x100000000000004=
4
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Tomer Tayar <ttayar@habana.ai>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
> Cc: Kuehling Felix <Felix.Kuehling@amd.com>
> Cc: Tuikov Luben <Luben.Tuikov@amd.com>
> Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
>
>
> Aravind Iddamsetty (5):
>   drm/netlink: Add netlink infrastructure
>   drm/xe/RAS: Register netlink capability
>   drm/xe/RAS: Expose the error counters
>   drm/netlink: Define multicast groups
>   drm/xe/RAS: send multicast event on occurrence of an error
>
>  drivers/gpu/drm/Makefile             |   1 +
>  drivers/gpu/drm/drm_drv.c            |   7 +
>  drivers/gpu/drm/drm_netlink.c        | 195 ++++++++++
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device.c       |   4 +
>  drivers/gpu/drm/xe/xe_device_types.h |   1 +
>  drivers/gpu/drm/xe/xe_hw_error.c     |  33 ++
>  drivers/gpu/drm/xe/xe_netlink.c      | 517 +++++++++++++++++++++++++++
>  include/drm/drm_device.h             |   8 +
>  include/drm/drm_drv.h                |   7 +
>  include/drm/drm_netlink.h            |  35 ++
>  include/uapi/drm/drm_netlink.h       |  87 +++++
>  include/uapi/drm/xe_drm.h            |  81 +++++
>  13 files changed, 977 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_netlink.c
>  create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>  create mode 100644 include/drm/drm_netlink.h
>  create mode 100644 include/uapi/drm/drm_netlink.h
>
> --
> 2.25.1
>
