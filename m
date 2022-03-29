Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4349E4EA4CA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 03:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B2010E358;
	Tue, 29 Mar 2022 01:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1612610E358
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 01:54:43 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id k21so27840530lfe.4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 18:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qAcSZvJ1Cp00rVuvNQwr6N+zWuW/fS6aMXRxFBaHpW4=;
 b=fxBtDXoxPQEO4mHuzySDU7lDg1lh9fWNnk4lii6GVk6cZa/xXOcLl09m7rUiDuULcc
 3GarblT+9HuSrWH1EkiYsj3GO/e53cWi2G67XXz9B9+i07A1kgCFFdLT87mAzVoDpFBA
 wul12G6ijTx9cSQGZhfi/4VouuhzqEuWynh0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qAcSZvJ1Cp00rVuvNQwr6N+zWuW/fS6aMXRxFBaHpW4=;
 b=Pv5rK8px6r+nPTmrJASlPRl8iQUjl5msSQoKgFrijDJSwzgLXgLdNgj/0Q8TN9LBZ0
 QGnKXFCfoQfnu1luI9l1CkBIVmwIoL7hV+no5tbW2cH7RtHo8ftkIebSnCXRQGdNH6fv
 t7xVToEHw7O8BsryblT4bDeKluavvWDa0ZiKVyfaqZffAF8lGt7mAn9uVAQU2iJ3OcO8
 4BYsERfjcyMLSu6bPzU2GExYs/WluGTT9nvPiZtobruQAVRWZTJumRdmP/hKM2XyHHlG
 6EePPTaq1yqpkODILjAuiEOPbAGzqiyOf3KBiiBQD7xN7KMOd4+DRzIpGh9NZA2Xudog
 DAfA==
X-Gm-Message-State: AOAM530lwZox7WzFC/4XyESTPPMhQ94u5DlUo8gAHmfcIEWfOWGb02f3
 uPbs+azJ6kdrmggTEuvsmJizfEIjlVfVsEa5
X-Google-Smtp-Source: ABdhPJwefomASqaakO4LybgJzEE64L2h84/VbmR06/6JMtS1Wohj64o+D2qKzg3wxQ6avot8qAQxoQ==
X-Received: by 2002:a05:6512:128e:b0:44a:4067:9ffe with SMTP id
 u14-20020a056512128e00b0044a40679ffemr418299lfs.64.1648518881788; 
 Mon, 28 Mar 2022 18:54:41 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 h14-20020a0565123c8e00b0044a2ddb6694sm1809224lfv.124.2022.03.28.18.54.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 18:54:40 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id h11so21590397ljb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 18:54:40 -0700 (PDT)
X-Received: by 2002:a2e:9b10:0:b0:247:f28c:ffd3 with SMTP id
 u16-20020a2e9b10000000b00247f28cffd3mr396709lji.152.1648518879661; Mon, 28
 Mar 2022 18:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
In-Reply-To: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Mar 2022 18:54:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wibHWd_E7_YFxc8=RH9b0iL0VunosCkt=L6PcqcDbD+qg@mail.gmail.com>
Message-ID: <CAHk-=wibHWd_E7_YFxc8=RH9b0iL0VunosCkt=L6PcqcDbD+qg@mail.gmail.com>
Subject: amdgpu link problem (was Re: [git pull] drm for 5.18-rc1)
To: Dave Airlie <airlied@gmail.com>, Wenjing Liu <wenjing.liu@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Content-Type: multipart/mixed; boundary="0000000000003a7fc905db51b62b"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000003a7fc905db51b62b
Content-Type: text/plain; charset="UTF-8"

I didn't notice this until now, probably because everything still
_works_, but I get a new big warning splat at bootup on my main
workstation these days as of the merge window changes.

The full warning is attached, but it's basically the ASSERT(0) at line 938 in

  drivers/gpu/drm/amd/display/dc/core/dc_link.c

and it looks to have been introduced by commit c282d9512cdd
("drm/amd/display: factor out dp detection link training and mst top
detection").

This is the same old setup I've reported before, with some random
Radeon card with two monitors attached (PCI ID 1002:67df rev e7,
subsystem ID 1da2:e353).

I think the card went by the name "Sapphire Pulse RX 580 8GB" in case
any of that matters, but it's been working fine.

It still works fine, it just has a big ugly boot-time splat.

As mentioned, two 4K monitors attached, both over HDMI.

If there is any particular info you want, just let me know where/how
to find it, and I can provide.

                      Linus

--0000000000003a7fc905db51b62b
Content-Type: application/octet-stream; name=warn
Content-Disposition: attachment; filename=warn
Content-Transfer-Encoding: base64
Content-ID: <f_l1bgur1a0>
X-Attachment-Id: f_l1bgur1a0

CiAgLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCiAgV0FSTklORzogQ1BVOiAx
NSBQSUQ6IDgxNCBhdCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Nv
cmUvZGNfbGluay5jOjkzOCBkY19saW5rX2RldGVjdCsweGQ0Mi8weDEwZTAgW2FtZGdwdV0KICBN
b2R1bGVzIGxpbmtlZCBpbjogYW1kZ3B1KCspIGRybV90dG1faGVscGVyIHR0bSBpb21tdV92MiBn
cHVfc2NoZWQgZHJtX2RwX2hlbHBlciBkcm1fa21zX2hlbHBlciBpZ2IgYXRsYW50aWMgc3lzY29w
eWFyZWEgc3lzZmlsbHJlY3Qgc3lzaW1nYmx0IGZiX3N5c19mb3BzIGNyY3QxMGRpZl9wY2xtdWwg
Y3JjMzJfcGNsbXVsIGNyYzMyY19pbnRlbCBnaGFzaF9jbG11bG5pX2ludGVsIGRybSBkY2EgbWFj
c2VjIGkyY19hbGdvX2JpdCBudm1lIGNjcCBzcDUxMDBfdGNvIG52bWVfY29yZSBwaW5jdHJsX2Ft
ZCBmdXNlCiAgQ1BVOiAxNSBQSUQ6IDgxNCBDb21tOiBzeXN0ZW1kLXVkZXZkIE5vdCB0YWludGVk
IHY1LjE3LTEyODgyLWcxOTMwYTZlNzM5YzQgIzExCiAgSGFyZHdhcmUgbmFtZTogR2lnYWJ5dGUg
VGVjaG5vbG9neSBDby4sIEx0ZC4gVFJYNDAgQU9SVVMgTUFTVEVSL1RSWDQwIEFPUlVTIE1BU1RF
UiwgQklPUyBGNWMgMDMvMDUvMjAyMAogIFJJUDogMDAxMDpkY19saW5rX2RldGVjdCsweGQ0Mi8w
eDEwZTAgW2FtZGdwdV0KICBDb2RlOiBiOCBmZiBmZiBlYiA4MyA0MSA4YiA1NSAzOCA0OCA4ZCA3
NCAyNCAzOCA0YyA4OSBlZiBlOCBlMiAxMCAwMSAwMCA0OCA4ZCA3NCAyNCAxMCA0YyA4OSBlZiBi
YSAwMiAwMCAwMCAwMCBlOCAwMCAyNyAwMSAwMCBlYiAwMiA8MGY+IDBiIDg0IGRiIDQ1IDg5IGZl
IDQ1IDg5IGU3IDc0IDEzIDQ5IDhiIGJkIGI4IDAxIDAwIDAwIDQ4IDhiIGI3CiAgUlNQOiAwMDE4
OmZmZmZhNDI1NDE5NmY2OTAgRUZMQUdTOiAwMDAxMDI4MwogIFJBWDogMDAwMDAwMDAwMDAwMDAw
NCBSQlg6IDAwMDAwMDAwMDAwMDAwMDAgUkNYOiBmZmZmOTU1NjFjODIwMDAwCiAgUkRYOiBmZmZm
ZmZmZmMxMGVmYmQwIFJTSTogZmZmZmZmZmZjMTE2ZTAxOCBSREk6IDAwMDAwMDAwMDAwMDAwMDQK
ICBSQlA6IGZmZmY5NTU2MTdkMDAwMDAgUjA4OiBmZmZmZmZmZmMxMTZlMDYxIFIwOTogMDAwMDAw
MDAwMDAwMDAwMAogIFIxMDogMDAwMDAwMDAwMDAwMDAwNyBSMTE6IDAwMDAwMDAwMDAwMDAwMWUg
UjEyOiAwMDAwMDAwMDAwMDAwMDAwCiAgUjEzOiBmZmZmOTU1NjAxNTk0ODAwIFIxNDogMDAwMDAw
MDAwMDAwMDAwMCBSMTU6IDAwMDAwMDAwMDAwMDAwMDAKICBGUzogIDAwMDA3ZmE3NjM1ZDdiNDAo
MDAwMCkgR1M6ZmZmZjk1NjRmZTNjMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCiAg
Q1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwogIENSMjog
MDAwMDU1ZWQ5Yzg2Y2EyMCBDUjM6IDAwMDAwMDAxMWQ1MjgwMDAgQ1I0OiAwMDAwMDAwMDAwMzUw
ZWUwCiAgQ2FsbCBUcmFjZToKICAgPFRBU0s+CiAgID8gZGFsX2dwaW9fZGVzdHJveV9pcnErMHgy
NC8weDQwIFthbWRncHVdCiAgID8gZGNfbGlua19kZXRlY3Rfc2luaysweDE1NC8weDE4MCBbYW1k
Z3B1XQogICBkbV9od19pbml0KzB4MTMyNC8weDFkZDAgW2FtZGdwdV0KICAgPyBwaG1fd2FpdF9m
b3JfcmVnaXN0ZXJfdW5lcXVhbCsweDk5LzB4ZDAgW2FtZGdwdV0KICAgPyBwaG1fd2FpdF9mb3Jf
cmVnaXN0ZXJfdW5lcXVhbCsweDk5LzB4ZDAgW2FtZGdwdV0KICAgPyBwaG1fd2FpdF9mb3JfcmVn
aXN0ZXJfdW5lcXVhbCsweDk5LzB4ZDAgW2FtZGdwdV0KICAgYW1kZ3B1X2RldmljZV9pcF9od19p
bml0X3BoYXNlMisweDVmLzB4YTAgW2FtZGdwdV0KICAgYW1kZ3B1X2RldmljZV9pcF9pbml0KzB4
MmNjLzB4NDcwIFthbWRncHVdCiAgIGFtZGdwdV9kZXZpY2VfaW5pdCsweDE3YmQvMHgxZDkwIFth
bWRncHVdCiAgIGFtZGdwdV9kcml2ZXJfbG9hZF9rbXMrMHgxNS8weDE2MCBbYW1kZ3B1XQogICBh
bWRncHVfcGNpX3Byb2JlKzB4MjJhLzB4NGIwIFthbWRncHVdCiAgIHBjaV9kZXZpY2VfcHJvYmUr
MHgxYzcvMHgyNTAKICAgY2FsbF9kcml2ZXJfcHJvYmUrMHgzMi8weGQwCiAgIHJlYWxseV9wcm9i
ZSsweDE1Ny8weDM0MAogICBfX2RyaXZlcl9wcm9iZV9kZXZpY2UrMHhlOS8weDE2MAogICBfX2Ry
aXZlcl9hdHRhY2grMHgxMTIvMHgzYjAKICAgPyBkcml2ZXJfYXR0YWNoKzB4MjAvMHgyMAogICBi
dXNfZm9yX2VhY2hfZGV2KzB4ODMvMHhhMAogICBidXNfYWRkX2RyaXZlcisweDExMS8weDIxMAog
ICA/IDB4ZmZmZmZmZmZjMDY2ODAwMAogICBkcml2ZXJfcmVnaXN0ZXIrMHg4MS8weDEyMAogICBk
b19vbmVfaW5pdGNhbGwrMHg5Yy8weDFmMAogICBkb19pbml0X21vZHVsZSsweDRhLzB4MjEwCiAg
IGxvYWRfbW9kdWxlKzB4MTQ4NS8weDE2MTAKICAgPyBrZXJuZWxfcmVhZF9maWxlX2Zyb21fZmQr
MHg1ZC8weDgwCiAgIF9fc2Vfc3lzX2Zpbml0X21vZHVsZSsweGE0LzB4ZjAKICAgZG9fc3lzY2Fs
bF82NCsweDMxLzB4NTAKICAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhh
ZQogIFJJUDogMDAzMzoweDdmYTc2NDE2OWVjZAogIENvZGU6IDViIDQxIDVjIGMzIDY2IDBmIDFm
IDg0IDAwIDAwIDAwIDAwIDAwIGYzIDBmIDFlIGZhIDQ4IDg5IGY4IDQ4IDg5IGY3IDQ4IDg5IGQ2
IDQ4IDg5IGNhIDRkIDg5IGMyIDRkIDg5IGM4IDRjIDhiIDRjIDI0IDA4IDBmIDA1IDw0OD4gM2Qg
MDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggOGIgMGQgMmIgZWYgMGUgMDAgZjcgZDggNjQgODkgMDEg
NDgKICBSU1A6IDAwMmI6MDAwMDdmZmQ3ZWE4OGZkOCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdfUkFY
OiAwMDAwMDAwMDAwMDAwMTM5CiAgUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDU1OThl
NmQ3MDFmMCBSQ1g6IDAwMDA3ZmE3NjQxNjllY2QKICBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJ
OiAwMDAwN2ZhNzY0MmQwMzJjIFJESTogMDAwMDAwMDAwMDAwMDAxNwogIFJCUDogMDAwMDAwMDAw
MDAyMDAwMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAyCiAgUjEw
OiAwMDAwMDAwMDAwMDAwMDE3IFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDA3ZmE3NjQy
ZDAzMmMKICBSMTM6IDAwMDA1NTk4ZTZkNzAxNTAgUjE0OiAwMDAwMDAwMDAwMDAwMDA3IFIxNTog
MDAwMDU1OThlNmQ1NmZkMAogICA8L1RBU0s+CiAgLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAw
MDAwMCBdLS0tCg==
--0000000000003a7fc905db51b62b--
