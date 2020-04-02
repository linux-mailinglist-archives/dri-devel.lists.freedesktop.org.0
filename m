Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7892E19D091
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532216EB0E;
	Fri,  3 Apr 2020 06:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9D76E9F9;
 Thu,  2 Apr 2020 07:39:53 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id dj7so1076321edb.12;
 Thu, 02 Apr 2020 00:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KzbFnt9ylB2DEWv1++v392dMuMsHvkloyGcZEm/gZgk=;
 b=ddIiPSdUjhzBMZXccAjZC5AcBacGa4D+e4qrUo5JxSxmvp/3Wva0u5DabomJnDIkHo
 PQOxcG8cEPtRRvGmRgf449AZJ+YNox/ofvYG25SBit5zOQm96qokS4IFlqgXJVMWXZqt
 viexeyDYlGxNvcFar8NpuokuhqTwZAXf3t7coeCB7/22d6b4fZotwBi/1MoFbqdoRL4I
 gMbRe9BKPa+hSXayjSpOzo/BnLD36noNogha7SE6e43EBnJwlQONq7MdqInir3FPyQwT
 bbBH5/jmSPEpfGFIC5mH9QYoIB3NZEGdKpBpZvRQ2YQ7GCwcaJDIMmn0GLvVS3YskG4Q
 ERlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KzbFnt9ylB2DEWv1++v392dMuMsHvkloyGcZEm/gZgk=;
 b=ITTpW7gv0hngyUC7l/+2YQ4cLFQNZWLgQnrpYNsXqJ9ZxhONf24DcRjd6rRujxyilm
 0d3doPzlR92XQi3izuD2PmcnAd8iXCHKI2icws7UrMnwD12mzFq5X/VlhhI4lW+AhWyC
 RTtTs7L+i+Hd342Q5wILbf/Qlg6D3MLPnvn1YLUkJtCuJKKjrYzPSz+pIKxpKyG5fNIc
 xzOJeSv2Qiw7d3jlJHp2ClFX/vKacpvRmAGtjBiKRSz9ysgDzCQdAsxGl4lOuL8rnHf0
 03r1PVozoaF9S/IGNcdcYnDmxpDy61QCCR9N2YT1qbmHC/jJhWLLscKRpPNecGDb1dA1
 oTYA==
X-Gm-Message-State: AGi0PubK5TATpG0Uu0dKhFNPLZYTk0/9q7lGXaS0mTtz2kVK9yeni9FN
 MBsXSyShVj/UjbndlRwgyfWxGC7KtaOMJNXR8kc=
X-Google-Smtp-Source: APiQypJf/iwylvaTLwpPQYDQmRS33aaZYlMQqvYyNzVga57AG0GFRlu0FoHRMNsOzoT0pVLjvhHc4GhgLxBRf2ldRfI=
X-Received: by 2002:a17:906:2ccc:: with SMTP id
 r12mr1931510ejr.47.1585813191756; 
 Thu, 02 Apr 2020 00:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <83618b63-b852-9e6d-b460-001fd7900b37@suse.de>
In-Reply-To: <83618b63-b852-9e6d-b460-001fd7900b37@suse.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 2 Apr 2020 09:39:40 +0200
Message-ID: <CAFBinCBr8C9oinGJEJJwUDTsNaOWuajxiVVqgMMJjnNCMY8TmA@mail.gmail.com>
Subject: Re: lima,
 panfrost: multiple definition of `of_devfreq_cooling_register_power'
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="000000000000f9fad205a249e76f"
X-Mailman-Approved-At: Fri, 03 Apr 2020 06:54:15 +0000
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
Cc: tomeu.vizoso@collabora.com, lima@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, yuq825@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f9fad205a249e76f
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Thu, Apr 2, 2020 at 9:26 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi,
>
> building lima and panfrost drivers from drm-tip, I currently get the
> following linker error
>
>   > make clean
>   > make
>   [...]
>   LD      vmlinux.o
>   arm-suse-linux-gnueabi-ld: drivers/gpu/drm/panfrost
>         /panfrost_devfreq.o: in function
>         `of_devfreq_cooling_register_power':
>   panfrost_devfreq.c:(.text+0x18c): multiple definition of
>         `of_devfreq_cooling_register_power'; drivers/gpu/drm/lima
>         /lima_devfreq.o:lima_devfreq.c:(.text+0x1a0): first defined here
>   make[1]: *** [/home/tzimmermann/Projekte/linux/Makefile:1078: vmlinux]
>         Error 1
>   make[1]: Leaving directory '/home/tzimmermann/Projekte/linux/build-
>         arm'
>   make: *** [Makefile:180: sub-make] Error 2
can you please try building again with the attached patch?

> Seems related to
>
>   commit 1996970773a323533e1cc1b6b97f00a95d675f32
>   Author: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>   Date:   Thu Mar 19 21:34:27 2020 +0100
>
>     drm/lima: Add optional devfreq and cooling device support
>
> https://cgit.freedesktop.org/drm/drm-tip/commit/?id=1996970773a323533e1cc1b6b97f00a95d675f32
it's also possible that this was originally caused by a76caf55e5b356
("thermal: Add devfreq cooling") and that my commit only exposes this
bug


Thank you in advance!
Regards
Martin

--000000000000f9fad205a249e76f
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="inline-of_devfreq_cooling_register_power-stub.patch"
Content-Disposition: attachment; 
	filename="inline-of_devfreq_cooling_register_power-stub.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k8ig5xhc0>
X-Attachment-Id: f_k8ig5xhc0

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOC5kdHNpIGIvYXJjaC9hcm0vYm9v
dC9kdHMvbWVzb244LmR0c2kKaW5kZXggYTA2YTlmYjM1ZDcyLi45NGE0ODdlMDVkMzUgMTAwNjQ0
Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL21lc29uOC5kdHNpCkBAIC0xMDcsMTggKzEwNywyMiBAQCBvcHAtODE2MDAwMDAwIHsKIAkJ
CW9wcC1taWNyb3ZvbHQgPSA8ODc1MDAwPjsKIAkJfTsKIAkJb3BwLTEwMDgwMDAwMDAgeworCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKIAkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8MTAwODAwMDAwMD47
CiAJCQlvcHAtbWljcm92b2x0ID0gPDkyNTAwMD47CiAJCX07CiAJCW9wcC0xMjAwMDAwMDAwIHsK
KwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQlvcHAtaHogPSAvYml0cy8gNjQgPDEyMDAwMDAw
MDA+OwogCQkJb3BwLW1pY3Jvdm9sdCA9IDw5NzUwMDA+OwogCQl9OwogCQlvcHAtMTQxNjAwMDAw
MCB7CisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDwxNDE2
MDAwMDAwPjsKIAkJCW9wcC1taWNyb3ZvbHQgPSA8MTAyNTAwMD47CiAJCX07CiAJCW9wcC0xNjA4
MDAwMDAwIHsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCQlvcHAtaHogPSAvYml0cy8gNjQg
PDE2MDgwMDAwMDA+OwogCQkJb3BwLW1pY3Jvdm9sdCA9IDwxMTAwMDAwPjsKIAkJfTsKQEAgLTE0
NCwxOSArMTQ4LDIzIEBAIG9wcC0xODIxNDI4NTcgewogCQlvcHAtMzE4NzUwMDAwIHsKIAkJCW9w
cC1oeiA9IC9iaXRzLyA2NCA8MzE4NzUwMDAwPjsKIAkJCW9wcC1taWNyb3ZvbHQgPSA8MTE1MDAw
MD47CisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9OwogCQlvcHAtNDI1MDAwMDAwIHsKIAkJ
CW9wcC1oeiA9IC9iaXRzLyA2NCA8NDI1MDAwMDAwPjsKIAkJCW9wcC1taWNyb3ZvbHQgPSA8MTE1
MDAwMD47CisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9OwogCQlvcHAtNTEwMDAwMDAwIHsK
IAkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NTEwMDAwMDAwPjsKIAkJCW9wcC1taWNyb3ZvbHQgPSA8
MTE1MDAwMD47CisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9OwogCQlvcHAtNjM3NTAwMDAw
IHsKIAkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NjM3NTAwMDAwPjsKIAkJCW9wcC1taWNyb3ZvbHQg
PSA8MTE1MDAwMD47CiAJCQl0dXJiby1tb2RlOworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJ
fTsKIAl9OwogCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tZXNvbjhiLmR0c2kgYi9h
cmNoL2FybS9ib290L2R0cy9tZXNvbjhiLmR0c2kKaW5kZXggMmI0OWE2YmI4NzE4Li5lYWY0ZDYx
ZTUwNDMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGIuZHRzaQorKysgYi9h
cmNoL2FybS9ib290L2R0cy9tZXNvbjhiLmR0c2kKQEAgLTM0OSw3ICszNDksNiBAQCB2cHU6IHZw
dUAxMDAwMDAgewogCQkJbnZtZW0tY2VsbC1uYW1lcyA9ICJjdmJzX3RyaW1taW5nIjsKIAkJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJI3NpemUtY2VsbHMgPSA8MD47Ci0JCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOwogCiAJCQkvKiBDVkJTIFZEQUMgb3V0cHV0IHBvcnQgKi8KIAkJCWN2YnNfdmRh
Y19wb3J0OiBwb3J0QDAgewpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kZXZmcmVxX2Nvb2xp
bmcuaCBiL2luY2x1ZGUvbGludXgvZGV2ZnJlcV9jb29saW5nLmgKaW5kZXggNDYzNWY5NTAwMGE0
Li43OWE2ZTM3YTFkNmYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZGV2ZnJlcV9jb29saW5n
LmgKKysrIGIvaW5jbHVkZS9saW51eC9kZXZmcmVxX2Nvb2xpbmcuaApAQCAtNzUsNyArNzUsNyBA
QCB2b2lkIGRldmZyZXFfY29vbGluZ191bnJlZ2lzdGVyKHN0cnVjdCB0aGVybWFsX2Nvb2xpbmdf
ZGV2aWNlICpkZmMpOwogCiAjZWxzZSAvKiAhQ09ORklHX0RFVkZSRVFfVEhFUk1BTCAqLwogCi1z
dHJ1Y3QgdGhlcm1hbF9jb29saW5nX2RldmljZSAqCitzdGF0aWMgaW5saW5lIHN0cnVjdCB0aGVy
bWFsX2Nvb2xpbmdfZGV2aWNlICoKIG9mX2RldmZyZXFfY29vbGluZ19yZWdpc3Rlcl9wb3dlcihz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBzdHJ1Y3QgZGV2ZnJlcSAqZGYsCiAJCQkJICBzdHJ1Y3Qg
ZGV2ZnJlcV9jb29saW5nX3Bvd2VyICpkZmNfcG93ZXIpCiB7Cg==
--000000000000f9fad205a249e76f
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--000000000000f9fad205a249e76f--
