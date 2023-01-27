Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396BF67DD51
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 07:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C6110E3F4;
	Fri, 27 Jan 2023 06:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1CB10E3F3;
 Fri, 27 Jan 2023 06:01:12 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id w15so3193577qvs.11;
 Thu, 26 Jan 2023 22:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yOM2BTMQsd5EWc0ETAJrbaPw54YmRb+WPZenE7D1MAs=;
 b=B1O7GWzCLpb7ES011NQvsyQYHrGetlvye7BeYPVbz1dLHB7JAKsOiYuox/cEfuVqGW
 oA2Fr11kphhDlMCBT45qL1R23V8yENT299JIf+JYuuQ9czGPQW8YAHUq1CXPLUwlqwF3
 l3Hog+I+D0RK7E7RS7ndjl3VIvt8uw/D11rARYmOrfvogrr9Hkn3dLwqH50ZrhzWtSc2
 uVUJeHP1n83kcVO24ZNtqISadfWbUtQNQrihvHU7V7P/F+twXyvElNnS5gT3ypuLeNpU
 QxjPa6ScxlrsDvdn/imbiGaQ+mclIZEIspPYzG9HjYBMqDSdN/B6z7tvOLTzgBJLM5WK
 u4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yOM2BTMQsd5EWc0ETAJrbaPw54YmRb+WPZenE7D1MAs=;
 b=wxuoqcYIs1TrNBatlXMrBNzhd+dSlz5d0NhSdnziR9fW9WRBJ/VWSG9KAMgupUzM2g
 ekUuVxtVK9bJsAvwiAK61Gg/LLcLlUWiGVw6oyReS50xiGNySWI4zaWKkuT7qlDpJ82z
 /j9umrfWn6bv91BtM35RAYWvOiqdKoqWx0foJHtBCJtXh/+ptqHOKwQO96TxKR0bg/7W
 2AcSk7Lv8rQ2qLawp1FA82UXi2lcEBH+c2dK512aqDCQ0FwQ9ZR2qmji+RVoaMl8LRZ0
 L8VHTVLeJ0yAL5NKPG1A+22nFPBAvPyT3s8NIcYAW3jEc51HL32VandeCY+39R9cF2ch
 4gzQ==
X-Gm-Message-State: AFqh2kpTGmQ7twgbRbYkW3NvmydOUGhDiEbkt1TJ+f5otpGpWrDC7vuk
 sbdNonTDBnWhx7bCSzlHByiBlkEGn31vaSLNT/E=
X-Google-Smtp-Source: AMrXdXtwSOFalVBpEg2n39CHs+qTTqaUr5Fmu7CaOqv92Q4SKuQW0kYfF2XJYdGkEXWd6Jqy6qYZWJumjaNAqE1Q8tg=
X-Received: by 2002:a05:6214:5c42:b0:534:1fd4:72ec with SMTP id
 lz2-20020a0562145c4200b005341fd472ecmr1989577qvb.65.1674799271186; Thu, 26
 Jan 2023 22:01:11 -0800 (PST)
MIME-Version: 1.0
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
 <CAMwc25rY4xpn0yvCScMr6Hk9pFSdvt=9QOypSQDfj1d5tWmtvA@mail.gmail.com>
 <20230116122403.upk5ci4mbebw23m7@wslaptop>
 <CACAvsv48vH6hbacQCN+yKP8ZcDjFMWciBt6U_Xv-LEYJHZ1q9g@mail.gmail.com>
 <20230120113443.wgwhwp7tm6rnc6je@wslaptop>
In-Reply-To: <20230120113443.wgwhwp7tm6rnc6je@wslaptop>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 27 Jan 2023 16:00:59 +1000
Message-ID: <CACAvsv4_XJLSwnA-s0BXLVbBCESDfnK7kx5-WUPd2+vdJuMojg@mail.gmail.com>
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Content-Type: multipart/mixed; boundary="000000000000a1bc5505f33897c9"
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
Cc: regressions@lists.linux.dev, kherbst@redhat.com, kwizart@gmail.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a1bc5505f33897c9
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Jan 2023 at 21:37, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
>
> On Wed, Jan 18, 2023 at 11:28:49AM +1000, Ben Skeggs wrote:
> > On Mon, 16 Jan 2023 at 22:27, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> > > On Mon, Jan 16, 2023 at 07:45:05AM +1000, David Airlie wrote:
> > > > As a quick check can you try changing
> > > >
> > > > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_mem_target
> > > > from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?
>
> > In addition to Dave's change, can you try changing the
> > nvkm_falcon_load_dmem() call in gm20b_pmu_init() to:
> >
> > nvkm_falcon_pio_wr(falcon, (u8 *)&args, 0, 0, DMEM, addr_args,
> > sizeof(args), 0, false);
>
> Hello!
>
> Chiming in just to say that with this change I see the same as Nicolas
> except that the init message size is 255 instead of 0:
>
> [    2.196934] nouveau 57000000.gpu: pmu: unexpected init message size 255 vs 42
I've attached an entirely untested patch (to go on top of the other
hacks/fixes so far), that will hopefully get us a little further.

Would be great if you guys could test it out for me.

Thanks,
Ben.

--000000000000a1bc5505f33897c9
Content-Type: text/x-patch; charset="US-ASCII"; name="gm20b.diff"
Content-Disposition: attachment; filename="gm20b.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lde479jx0>
X-Attachment-Id: f_lde479jx0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZmFsY29uL2dtMjAwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2ZhbGNvbi9nbTIwMC5jCmluZGV4IDM5M2Fk
ZTlmN2U2Yy4uYjdkYTNhYjQ0YzI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL2ZhbGNvbi9nbTIwMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
ZmFsY29uL2dtMjAwLmMKQEAgLTQ4LDYgKzQ4LDE2IEBAIGdtMjAwX2ZsY25fcGlvX2RtZW1fcmQo
c3RydWN0IG52a21fZmFsY29uICpmYWxjb24sIHU4IHBvcnQsIGNvbnN0IHU4ICppbWcsIGludCBs
CiAJCWltZyArPSA0OwogCQlsZW4gLT0gNDsKIAl9CisKKwkvKiBTaWdoLiAgVGVncmEgUE1VIEZX
J3MgaW5pdCBtZXNzYWdlLi4uICovCisJaWYgKGxlbikgeworCQl1MzIgZGF0YSA9IG52a21fZmFs
Y29uX3JkMzIoZmFsY29uLCAweDFjNCArIChwb3J0ICogOCkpOworCisJCXdoaWxlIChsZW4tLSkg
eworCQkJKih1OCAqKWltZysrID0gZGF0YSAmIDB4ZmY7CisJCQlkYXRhID4+PSA4OworCQl9CisJ
fQogfQogCiBzdGF0aWMgdm9pZApAQCAtNjQsNiArNzQsOCBAQCBnbTIwMF9mbGNuX3Bpb19kbWVt
X3dyKHN0cnVjdCBudmttX2ZhbGNvbiAqZmFsY29uLCB1OCBwb3J0LCBjb25zdCB1OCAqaW1nLCBp
bnQgbAogCQlpbWcgKz0gNDsKIAkJbGVuIC09IDQ7CiAJfQorCisJV0FSTl9PTihsZW4pOwogfQog
CiBzdGF0aWMgdm9pZApAQCAtNzQsNyArODYsNyBAQCBnbTIwMF9mbGNuX3Bpb19kbWVtX3dyX2lu
aXQoc3RydWN0IG52a21fZmFsY29uICpmYWxjb24sIHU4IHBvcnQsIGJvb2wgc2VjLCB1MzIgZAog
CiBjb25zdCBzdHJ1Y3QgbnZrbV9mYWxjb25fZnVuY19waW8KIGdtMjAwX2ZsY25fZG1lbV9waW8g
PSB7Ci0JLm1pbiA9IDQsCisJLm1pbiA9IDEsCiAJLm1heCA9IDB4MTAwLAogCS53cl9pbml0ID0g
Z20yMDBfZmxjbl9waW9fZG1lbV93cl9pbml0LAogCS53ciA9IGdtMjAwX2ZsY25fcGlvX2RtZW1f
d3IsCg==
--000000000000a1bc5505f33897c9--
