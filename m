Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1923E1B07
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 20:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F216E862;
	Thu,  5 Aug 2021 18:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029426E3EB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 18:14:40 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id u13so8278131lje.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 11:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1trO0cpGKN3+/lgO6GyM0AvZf7CokD2vczVT+ofcBes=;
 b=Gw+9WwZDL4EANAb2g3+ASwPMHWmn0qy3KLkauW7qCj/EDBxMdtrIeaSYVgKXWjrNa8
 e4RoJzhJU92BkyVRpX9kmhK0dXzAgjGPYxlHFxsaqPUDbVKQHcZ5r+ipHFEtrZuvPyCK
 9GzP0WFrIk/uS7tk0M6UVM52VKpqygcAiNB24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1trO0cpGKN3+/lgO6GyM0AvZf7CokD2vczVT+ofcBes=;
 b=dtbwaZ8ajSRi4GYLz68+qgyBQ9YXa3pcQ3Z/EmrtoqLF1u19X0V55rTYHtfApx8fIq
 hTq38GLrcjL9f74Y9UWcmuk6/bTGQofjeM0kFvDtZmfeocXC7DEZPkdpwoAvPVoNv2JY
 /fETTCpLhzfeeaPaGVR4sBSml1AkQ9BCU5j4oRByybCVbF8AbhUQ7+U3Ay8tEiJsTDOI
 pVnd3AIeaF7r6hgdKJH1ePF8UQ6acHxRoaoKtId8y+roWiIlpsGIl+xo9LIvZYIyYGw+
 v6QFDXo3gTrzN/6Eg8BhNCOZp6X0H43IIXCxJm2FsAxcsABCsUsZOeLa03j/MyECxjX9
 FrLg==
X-Gm-Message-State: AOAM530P17eEKLWANtaUUpM4NRpMJDPcpDSHwhRrYad7V/0F+qujjbkK
 F7grGQTGvPqQbz4cTc3uv+VGYHsxo8G+Lshxyak=
X-Google-Smtp-Source: ABdhPJxm852H6KM/TbgROE9YB0UkWq64vDdYNF2H0qVphUATc9uAhwcR9xkCjdkh7heU4vsJjESb3A==
X-Received: by 2002:a2e:888f:: with SMTP id k15mr4053358lji.326.1628187279005; 
 Thu, 05 Aug 2021 11:14:39 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id u3sm238095lfu.151.2021.08.05.11.14.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 11:14:37 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id c16so12865161lfc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 11:14:37 -0700 (PDT)
X-Received: by 2002:ac2:4885:: with SMTP id x5mr4483190lfc.487.1628187277276; 
 Thu, 05 Aug 2021 11:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twko1gCNTB3CPf7CAQqWFayMj=1fa3ZoEwwviDFhF48kQ@mail.gmail.com>
In-Reply-To: <CAPM=9twko1gCNTB3CPf7CAQqWFayMj=1fa3ZoEwwviDFhF48kQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Aug 2021 11:14:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgYq=EpNmDPNVxnBX+HpjNcQg50DSjuxZuK0UbZjh-pnQ@mail.gmail.com>
Message-ID: <CAHk-=wgYq=EpNmDPNVxnBX+HpjNcQg50DSjuxZuK0UbZjh-pnQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.14-rc4
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="0000000000004a842905c8d3e487"
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

--0000000000004a842905c8d3e487
Content-Type: text/plain; charset="UTF-8"

This might possibly have been fixed already by the previous drm pull,
but I wanted to report it anyway, just in case.

It happened after an uptime of over a week, so it might not be trivial
to reproduce.

It's a NULL pointer dereference in dc_stream_retain() with the code being

        lock xadd %eax,0x390(%rdi) <-- trapping instruction

and that's just the

        kref_get(&stream->refcount);

with a NULL 'stream' argument.

  Call Trace:
   dc_resource_state_copy_construct+0x13f/0x190 [amdgpu]
   amdgpu_dm_atomic_commit_tail+0xd5/0x1540 [amdgpu]
   commit_tail+0x97/0x180 [drm_kms_helper]
   process_one_work+0x1df/0x3a0

the oops is followed by a stream of

  [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:55:crtc-1]
hw_done or flip_done timed out

and the machine was not usable afterwards.

lspci says this is a

 49:00.0 VGA compatible controller [0300]:
   Advanced Micro Devices, Inc. [AMD/ATI] Ellesmere
   [Radeon RX 470/480/570/570X/580/580X/590]
   [1002:67df] (rev e7) (prog-if 00 [VGA controller])

Full oops in the attachment, but I think the above is all the really
salient details.

                   Linus

--0000000000004a842905c8d3e487
Content-Type: application/octet-stream; name=amd-gpu-ooops
Content-Disposition: attachment; filename=amd-gpu-ooops
Content-Transfer-Encoding: base64
Content-ID: <f_krz8naen0>
X-Attachment-Id: f_krz8naen0

CiAgQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAw
MDAwMDAwMzkwCiAgI1BGOiBzdXBlcnZpc29yIHdyaXRlIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQog
ICNQRjogZXJyb3JfY29kZSgweDAwMDIpIC0gbm90LXByZXNlbnQgcGFnZQogIFBHRCAwIFA0RCAw
IAogIE9vcHM6IDAwMDIgWyMxXSBTTVAgTk9QVEkKICBDUFU6IDQ4IFBJRDogNDE1MjM3MiBDb21t
OiBrd29ya2VyL3UxMjg6MCBOb3QgdGFpbnRlZCA1LjE0LjAtcmMyLTAwMzEyLWczYzdhZGRjMDUy
NjUgIzcKICBIYXJkd2FyZSBuYW1lOiBHaWdhYnl0ZSBUZWNobm9sb2d5IENvLiwgTHRkLiBUUlg0
MCBBT1JVUyBNQVNURVIvVFJYNDAgQU9SVVMgTUFTVEVSLCBCSU9TIEY1YyAwMy8wNS8yMDIwCiAg
V29ya3F1ZXVlOiBldmVudHNfdW5ib3VuZCBjb21taXRfd29yayBbZHJtX2ttc19oZWxwZXJdCiAg
UklQOiAwMDEwOmRjX3N0cmVhbV9yZXRhaW4rMHhmLzB4NDAgW2FtZGdwdV0KICBDb2RlOiAxOSAw
MCA3MiAwYSBiOCAwMiAwMCAwMCAwMCA4MyAzZSAwMSA3NSAwNSBiOCAwMSAwMCAwMCAwMCA4OSA4
NyAzYyAwMyAwMCAwMCBjMyA5MCAwZiAxZiA0NCAwMCAwMCBiZSAwMSAwMCAwMCAwMCBiOCAwMSAw
MCAwMCAwMCA8ZjA+IDBmIGMxIDg3IDkwIDAzIDAwIDAwIDg1IGMwIDc0IDA4IDhkIDQ4IDAxIDA5
IGMxIDc4IDA2IGMzIGJlIDAyCiAgUlNQOiAwMDE4OmZmZmZhMTc0MTJmMjdiNTAgRUZMQUdTOiAw
MDAxMDI0NgogIFJBWDogMDAwMDAwMDAwMDAwMDAwMSBSQlg6IGZmZmY5YWEzNTU1YTAwMDAgUkNY
OiAwMDAwMDAwMDAwMDAwMDAwCiAgUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAw
MDAwMDAwMSBSREk6IDAwMDAwMDAwMDAwMDAwMDAKICBSQlA6IGZmZmZhMTc0MTJmMjdlNjAgUjA4
OiAwMDAwMDAwMDAwMDIwMDAwIFIwOTogMDAwMDAwMDAwMDAwMDBjMAogIFIxMDogMDAwMDAwMDAw
MDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAwMDUgUjEyOiBmZmZmOWFhMzU1NWEwMDAwCiAgUjEz
OiBmZmZmOWFhMzU1NWEwMDUwIFIxNDogMDAwMDAwMDAwMDAwMDAwMSBSMTU6IDAwMDAwMDAwMDAw
MDAwMDAKICBGUzogIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjlhYWNiZWMwMDAwMCgw
MDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCiAgQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAw
IENSMDogMDAwMDAwMDA4MDA1MDAzMwogIENSMjogMDAwMDAwMDAwMDAwMDM5MCBDUjM6IDAwMDAw
MDAxMTNmNjAwMDAgQ1I0OiAwMDAwMDAwMDAwMzUwZWUwCiAgQ2FsbCBUcmFjZToKICAgZGNfcmVz
b3VyY2Vfc3RhdGVfY29weV9jb25zdHJ1Y3QrMHgxM2YvMHgxOTAgW2FtZGdwdV0KICAgYW1kZ3B1
X2RtX2F0b21pY19jb21taXRfdGFpbCsweGQ1LzB4MTU0MCBbYW1kZ3B1XQogICBjb21taXRfdGFp
bCsweDk3LzB4MTgwIFtkcm1fa21zX2hlbHBlcl0KICAgcHJvY2Vzc19vbmVfd29yaysweDFkZi8w
eDNhMAogICB3b3JrZXJfdGhyZWFkKzB4MjZkLzB4NGEwCiAgIGt0aHJlYWQrMHgxNDMvMHgxNjAK
ICAgcmV0X2Zyb21fZm9yaysweDIyLzB4MzAKICBNb2R1bGVzIGxpbmtlZCBpbjogdWlucHV0IHJm
Y29tbSB4dF9DSEVDS1NVTSB4dF9NQVNRVUVSQURFIHh0X2Nvbm50cmFjayBpcHRfUkVKRUNUIG5m
X25hdF90ZnRwIG5mX2Nvbm50cmFja190ZnRwIGJyaWRnZSBzdHAgbGxjIG5mdF9vYmpyZWYgbmZf
Y29ubnRyYWNrX25ldGJpb3NfbnMgbmZfY29ubnRyYWNrX2Jyb2FkY2FzdCBuZnRfZmliX2luZXQg
bmZ0X2ZpYl9pcHY0IG5mdF9maWJfaXB2NiBuZnRfZmliIG5mdF9yZWplY3RfaW5ldCBuZl9yZWpl
Y3RfaXB2NCBuZl9yZWplY3RfaXB2NiBuZnRfcmVqZWN0IG5mdF9jdCBuZnRfY2hhaW5fbmF0IGlw
NnRhYmxlX25hdCBpcDZ0YWJsZV9tYW5nbGUgaXA2dGFibGVfcmF3IGlwNnRhYmxlX3NlY3VyaXR5
IGlwdGFibGVfbmF0IG5mX25hdCBuZl9jb25udHJhY2sgbmZfZGVmcmFnX2lwdjYgbmZfZGVmcmFn
X2lwdjQgaXB0YWJsZV9tYW5nbGUgaXB0YWJsZV9yYXcgaXB0YWJsZV9zZWN1cml0eSBpcF9zZXQg
bmZfdGFibGVzIGxpYmNyYzMyYyBuZm5ldGxpbmsgaXA2dGFibGVfZmlsdGVyIGlwNl90YWJsZXMg
aXB0YWJsZV9maWx0ZXIgY21hYyBibmVwIGl0ODcgaHdtb25fdmlkIHN1bnJwYyB2ZmF0IGZhdCBp
d2xtdm0gd21pX2Jtb2YgbXhtX3dtaSBtYWM4MDIxMSBsaWJhcmM0IGJ0dXNiIGJ0cnRsIGJ0YmNt
IGJ0aW50ZWwgYmx1ZXRvb3RoIGpveWRldiBzbmRfaGRhX2NvZGVjX2hkbWkgZWNkaF9nZW5lcmlj
IGVjYyBzbmRfaGRhX2ludGVsIHNuZF91c2JfYXVkaW8gc25kX2ludGVsX2RzcGNmZyBpd2x3aWZp
IHNuZF91c2JtaWRpX2xpYiBzbmRfaGRhX2NvZGVjIHNuZF9yYXdtaWRpIG1jIHBjc3BrciBzbmRf
aHdkZXAgY2ZnODAyMTEgc25kX3NlcSBzbmRfaGRhX2NvcmUgc25kX3NlcV9kZXZpY2Ugc25kX3Bj
bSByZmtpbGwgc25kX3RpbWVyIHNuZCBzb3VuZGNvcmUgazEwdGVtcCBpMmNfcGlpeDQgd21pIGFj
cGlfY3B1ZnJlcSB6cmFtIGlwX3RhYmxlcyBkbV9jcnlwdAogICBoaWRfbG9naXRlY2hfaGlkcHAg
aGlkX2xvZ2l0ZWNoX2RqIGFtZGdwdSBkcm1fdHRtX2hlbHBlciB0dG0gaW9tbXVfdjIgZ3B1X3Nj
aGVkIGNyY3QxMGRpZl9wY2xtdWwgY3JjMzJfcGNsbXVsIGRybV9rbXNfaGVscGVyIGNyYzMyY19p
bnRlbCBzeXNjb3B5YXJlYSBzeXNmaWxscmVjdCBzeXNpbWdibHQgZmJfc3lzX2ZvcHMgZ2hhc2hf
Y2xtdWxuaV9pbnRlbCBkcm0gaWdiIGF0bGFudGljIGRjYSBtYWNzZWMgaTJjX2FsZ29fYml0IG52
bWUgY2NwIHNwNTEwMF90Y28gbnZtZV9jb3JlIHBpbmN0cmxfYW1kIGZ1c2UKICBDUjI6IDAwMDAw
MDAwMDAwMDAzOTAKICAtLS1bIGVuZCB0cmFjZSAwOGIyYmMwYzUzOTUwNWNjIF0tLS0KCmZvbGxv
d2VkIGJ5CgogIFtkcm06YW1kZ3B1X2RtX2F0b21pY19jaGVjayBbYW1kZ3B1XV0gKkVSUk9SKiBb
Q1JUQzo1NTpjcnRjLTFdIGh3X2RvbmUgb3IgZmxpcF9kb25lIHRpbWVkIG91dAogIFtkcm06YW1k
Z3B1X2RtX2F0b21pY19jaGVjayBbYW1kZ3B1XV0gKkVSUk9SKiBbQ1JUQzo1NTpjcnRjLTFdIGh3
X2RvbmUgb3IgZmxpcF9kb25lIHRpbWVkIG91dAogIFtkcm06YW1kZ3B1X2RtX2F0b21pY19jaGVj
ayBbYW1kZ3B1XV0gKkVSUk9SKiBbQ1JUQzo1NTpjcnRjLTFdIGh3X2RvbmUgb3IgZmxpcF9kb25l
IHRpbWVkIG91dAogIC4uLgo=
--0000000000004a842905c8d3e487--
