Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M5pO7nhlWliVwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 16:58:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2304157870
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 16:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F4410E5EA;
	Wed, 18 Feb 2026 15:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NSnB7yKh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C778510E5ED
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 15:58:45 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-c46d4a02ff5so385616a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 07:58:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771430325; cv=none;
 d=google.com; s=arc-20240605;
 b=LICg6PoaRTGY3LumCZX8ibUQDB6lIwea0VzS+foAKwu4UKfnVX6lmWoNqZMUs118/v
 v1Yx8daKRxdaSM5njyFscEXm6LU8vaAtY4RLqHb9aJqtjvHBlpmKYPagXc/mXHpGSYt9
 m3C3UzGMYe27CpB50kV+ULGmx+nDRgHgUJusdxycI0GLYwmaBzk9x8W+Gi9Rip0qjOZ/
 i1q4qp7nZ6kKWr+OZjTZ39pQZSqoXJlR0svCzHhLtTUNXeSeLdPeoJy7tSPFDuPGM5kB
 nHr3KQyiRb8TOtE+EPJE7Jj+vdm9XCBtPUMp7C/rxlzyByPyJt8qJng0a0qEbtfStF/g
 WRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+jEZRhKDKJOk8SBTSDYiUNsfqMbSOB+ljt4JuK9uCrE=;
 fh=uwbSHout8PmRvf636Vcex9AMhRMlFEt8wb69btPSDTk=;
 b=XsM2FeB0Dt7dN38dW+lQ7QNV+pDODq10sBnyavFHgjShN7eKe1kCqJrDmG89H4HSQ9
 +PpfOoGVcy7ptk/CNulV8exuFdi6loap7Zacekj5OYpQjTujTtiazBh92P7PRard9xZn
 jgY6RzLoAcyMHqP0pmGtiARbSqOjntLtQ3jS//OdntA9b60GuD7jJYKxGAnyvrbD3bMM
 S7zCCkTP95CfK5ZVF03MsYopW9enk6s1kvDZWxnruzEWDQSdrlG7XL3GUqM+AUFgmKOa
 n8PfK1vZjHGzmXT+1YU0LHLWTkxt//bl40gSzeKdS0mqmDBpDm3NOCr9dqI0pg+E8BvG
 53uA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771430325; x=1772035125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+jEZRhKDKJOk8SBTSDYiUNsfqMbSOB+ljt4JuK9uCrE=;
 b=NSnB7yKhswAMWxXSRg1C7/1smf1Df3U4mxBLMTqYZ6RPfj/oCraAMANh23/w+V2jjM
 u09iLO/9Rt1fkA9p8XFew2/D3j0HMrhbLheyDijRu7pwY27oV1b5O1Eew6ZUou39RdTO
 uHfHz2OiAdI9EE79m0PSyQiUs6kTMk5nj8ksvCtayXKEBUYCGSauceZsD8nOK/RPlS5M
 JOKJa/jaKlnThUPpv7m8PlTzrJLOTdnEBQHjlclT8J+uZ93ox74R68mlRkTlwvR7UXXv
 LVQac6wLbedwHvaRcECtVBrLe6+lykm9sZxIcwqzoTlxDoWJuYWSmSiR/WMV9O5Oe0j8
 JSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771430325; x=1772035125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+jEZRhKDKJOk8SBTSDYiUNsfqMbSOB+ljt4JuK9uCrE=;
 b=kuwJHhclcCEhjRmBXKbOv/ltZwWaIquHaw5isK+p8LVgfN8lkN7DOHbZ9j8u+c2fb1
 dMRtvKpkv42cQUdlQmS/mMdV8aGxE0Maq6bafLNe+fQCJrAbnicLS/QXFY5veTaxnRP9
 RnBl4jzNfqLZv5IgaFDPAHRc5+fVJ2uDCAD5ZxBKkK6AIizb7k4ODCPAAm4eq1RUs6Ph
 F/zam1NRT3dusZywi10wt4PXXmBDMmH29e8K+7LTeK64uWpWAT2OPC7O5Xgd5C/P/Uf4
 dse3hIA2990MSxrE/SXOB774F969u9zKVrZS3Q2xm5+lYwZVizs9Ey5EACzwgCA4WR9n
 +IpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8YAbw0P+eGVvuEtNfeeic70qK1ZjwTW177JqTD0zGbAlzzB8RRYZYJr6MdGoCgMAi1SMErAk+B5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsrznahhZ9Vkl1RPXzPiDvVGsEK1HWJz8sibx0WKiu5vPa5sNA
 YtCjwiUTmCvCCIhIvq6weNvICCFCN0xapghs+/wjQ9dGPSlQuXL28gru03xbC8khgzzTDaIjshC
 Infvt+wOtfMbVvGOJm6mK5qQj2y2z2oc=
X-Gm-Gg: AZuq6aIO4b9/8k8BpRJR2wRNJopGKYEf/ZWTJUyQzEZ4bATCjI5PDQAsrtKBdd9MEty
 Pv3yMCG3vcSPzl7FqDOwwmvn+H+iEHYwXJtKf9K6h/f8Z2Ev1/VtP+QWnHBjqxJQQ/NkNKQhhBZ
 psM4pvT8iGKlcNiloYjqMvcMRE8lfzz4V5RxGPxUj+Yeu0+Z8tqLSqGK8zfImh47sdSxQQwwe7d
 vbDxqMcFQO8ORMhMzPmAaI933KKCRWJUij+hjowwMdJbGAnDmq/HIkPKCzBnVK4TLwLvrmePwjn
 TkSWZCE=
X-Received: by 2002:a17:90b:28c4:b0:340:bca2:cf82 with SMTP id
 98e67ed59e1d1-356a7a44588mr12483278a91.4.1771430325136; Wed, 18 Feb 2026
 07:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
 <CACSVV00iiAXGOqV2HZs9KREoqatE0eNBZjFH9hSFMmNaX3_RXw@mail.gmail.com>
 <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
 <c99beabf-9841-44cd-9450-2f339d1d5c41@oss.qualcomm.com>
In-Reply-To: <c99beabf-9841-44cd-9450-2f339d1d5c41@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 18 Feb 2026 10:58:33 -0500
X-Gm-Features: AaiRm51N5SpqVVJUQBLh2elCdDaV2cuIU7D7DKaGqf9-QJjihmDNYzh8f93hCZk
Message-ID: <CACu1E7EnveTSzi2QD83xEgsqrM1H33KCqMqcaLE-VebgOMbh0g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:rob.clark@oss.qualcomm.com,m:konradybcio@kernel.org,m:andersson@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:freedreno@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[cwabbott0@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cwabbott0@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: A2304157870
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 6:23=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/9/26 10:03 PM, Connor Abbott wrote:
> > On Fri, Jan 9, 2026 at 3:41=E2=80=AFPM Rob Clark <rob.clark@oss.qualcom=
m.com> wrote:
> >>
> >> On Fri, Jan 9, 2026 at 11:11=E2=80=AFAM Connor Abbott <cwabbott0@gmail=
.com> wrote:
> >>>
> >>> On Thu, Jan 8, 2026 at 9:22=E2=80=AFAM Konrad Dybcio <konradybcio@ker=
nel.org> wrote:
> >>>>
> >>>> SMEM allows the OS to retrieve information about the DDR memory.
> >>>> Among that information, is a semi-magic value called 'HBB', or Highe=
st
> >>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
> >>>> and MDSS) must retrieve in order to program the IP blocks correctly.
> >>>>
> >>>> This series introduces an API to retrieve that value, uses it in the
> >>>> aforementioned programming sequences and exposes available DDR
> >>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> >>>> information can be exposed in the future, as needed.
> >>>>
> >>>> Patch 3 should really be merged after 1&2
> >>>
> >>> No. The HBB value currently returned by the bootloader is *not* alway=
s
> >>> the same as what we use currently, because some SoCs (like SM8250)
> >>> with the same DT ship with multiple different DRAM configurations and
> >>> we've been using a sub-optimal value the whole time. After all, that'=
s
> >>> the whole point of using the bootloader value. But patches 1&2 will
> >>> only make the DPU use the bootloader value for HBB, not the GPU. So o=
n
> >>> one of the affected SoCs, it will introduce a mismatch. You can't
> >>> change anything until the GPU side uses the new ubwc config as its
> >>> source of truth.
> >>
> >> Hmm, how is this even working today if DPU is using HBB from the
> >> global table but GPU is not?  Are we just getting lucky with
> >> compositors that don't know about modifiers and end up scanning out
> >> linear?
> >
> > It works out as well as it's always worked out, i.e. we try to make
> > GPU and DPU config match and pray that we didn't mess it up. At least
> > now we'll get a warning when they don't match.
> >
> >>
> >> We do log warnings when the global ubwc config does not match the
> >> "fixed up" config.. google search for those msgs doesn't seem to turn
> >> up anything other than the patch which introduced them.  Idk if that
> >> is conclusive in any way, but I hope that means we could just delete
> >> the fixup code on the GPU side.  I suppose we could add:
> >>
> >>        *cfg =3D *common_cfg;
> >>
> >> after the warning as a first step.  That would maybe get some bug
> >> reports along with enough details in dmesg?
> >
> > Yes, the plan was always to delete the fixup code in the GPU config.
> > And even that first step would be enough to prevent regressions when
> > switching to the bootloader HBB value.
> >
> > There is a problem in that ubwc_swizzle isn't as well tested. Older
> > parts supporting UBWC 1.0-3.0 partially or entirely ignore
> > ubwc_swizzle, because it wasn't configurable back then, but we rely on
> > it being set correctly in Mesa for VK_EXT_host_image_copy and sparse
> > textures. So if ubwc_swizzle is incorrect you probably wouldn't
> > notice, until you hit the HIC codepath in zink or some game using
> > sparse textures. I think we fixed up all the cases where it was
> > incorrectly set to 0x1 instead of 0x7, but it would be worth it to
> > check again.
>
> Just to double-check, is your expectation to just double-check the kernel
> settings, or would that require some intervention on the mesa side too?
>
> Konrad

Just to double-check the kernel, and I double-checked since then and
everything seems to be right.

Connor
