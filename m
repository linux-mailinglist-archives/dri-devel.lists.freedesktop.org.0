Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E6F932EE6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 19:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089E110E294;
	Tue, 16 Jul 2024 17:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LFFasAaW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1883A10E162;
 Tue, 16 Jul 2024 17:10:50 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2cb2a6a8b2fso1388818a91.3; 
 Tue, 16 Jul 2024 10:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721149849; x=1721754649; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HBCcifw/MxneSumY4Gn53fiNKzT4rFL1SoKdpcBm9fI=;
 b=LFFasAaWiSvXySOMIBMLP7Y1WF7neh6qggWu1M8+vZM4HXD0TcUliPP2tWVPX/4IFq
 Zrgy+HXXgwGPe3CIqqmmzS5lFoQo5mE6MIPtyxGFlXEkir53c/b2jNo2MDCj665Ald2P
 8flHpTZGEfUOdk7FmdhcsECfIVOkbUV8KD0eDbLUP88wBzM9tscZQ97k+OkhqHINCnau
 /uhRjHEdLMnKokd0dxrMXhI3gPo6hOXEgPS8DtIY/BlHIQHUq1KIwLj84z8MCaUnbQZn
 KVpZz1pL6cPyfLe9+MElhwA45oL35r+2dh5Mt3Utc9wFPMq+WRojqi5UQJweACdz+ujT
 Xabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721149849; x=1721754649;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HBCcifw/MxneSumY4Gn53fiNKzT4rFL1SoKdpcBm9fI=;
 b=ODIk83kIG1eOGdBYme5cjCmiIElBK1lH1VNngPvyMPuWDwVAlAC4Lx+0q11qItPryU
 +fLrhJ5FMy7hv3DT0c5eFk3Fp+Fb4bXEZ+Wi5C/e2EkFi3LULnYI0HmghWRQapz3WFb1
 X6m+spf7FS18wuVvJt+xs97EdLWjds52njZe7vzjtIcds5ZSWtX7TMj3X1RlT2/yx8WJ
 h7jVDQDaOuNVK23eRmepFyPP+HFlFWDbHHua5pGP0cuRQ+Sfmd9zUx5UMmXKx44druw/
 7C5Bk39fsk9O53QLDXWjcPO/O6h2Gfe9chRwCEgo7pcFwxknLyAs4tv59e2Tckkxo8q1
 m4zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpPL4W5woTqeGd/a+/aOFTOg4mK9xZ/nnfkgq7pCTEkrGG8dDmAA7+3mrQ+FeZ9M6GDlb1b8ktI3EawSXwR+KXCPtAg1J+GN9KUqRmNajtouMuJlfY2BMvGv5ZSeGmp69DabH9EbZd6575tUKNVg==
X-Gm-Message-State: AOJu0YxpNDWAiJzAlaVh5iZ6jiqTzYXha2NMN7M/gG610hn+lB0cxZhK
 Ee7DvtVeJn1KmkCs4dtcjoun6zIA2lMe3bP+haZn1Zwds8MW/S8mJ4EqHeoHVuX9uM7x605Ta0J
 5luym5EDQT3II/WayGifAxgs3pkI=
X-Google-Smtp-Source: AGHT+IEDuw/AVQEdbV51NKAchZjEw/WYNsA6D5/dWMbPS5ZJqj3cU3E+5vndl4zzLETn8cK4hWqad44n6jDQRAxfsbw=
X-Received: by 2002:a17:90a:7890:b0:2c8:6eea:7ad8 with SMTP id
 98e67ed59e1d1-2cb3741810dmr2263105a91.26.1721149849285; Tue, 16 Jul 2024
 10:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
 <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
 <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
 <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
 <2915a8c4-ebac-4dae-8f09-32a5b4d9aeda@amd.com>
 <CABXGCsPuRViSd_WeOciLKcQ4hjYxJ7e3i7LomwsUMzd0a+zvBw@mail.gmail.com>
 <CABXGCsOsfP2SToiDhRAS51nPJ+Qr2v7B3Kjr+yVeP4G7zFZpMA@mail.gmail.com>
In-Reply-To: <CABXGCsOsfP2SToiDhRAS51nPJ+Qr2v7B3Kjr+yVeP4G7zFZpMA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Jul 2024 13:10:37 -0400
Message-ID: <CADnq5_Mjxna+aqhWT49YLmXGH+piittc4FUSyCDEJ8s7G-Rb3Q@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>, 
 Linux regressions mailing list <regressions@lists.linux.dev>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000005f5140061d606d94"
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

--0000000000005f5140061d606d94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does the attached partial revert fix it?

Alex

On Wed, Jul 10, 2024 at 3:03=E2=80=AFAM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> On Wed, Jul 10, 2024 at 12:01=E2=80=AFPM Mikhail Gavrilov
> <mikhail.v.gavrilov@gmail.com> wrote:
> >
> > On Tue, Jul 9, 2024 at 7:48=E2=80=AFPM Rodrigo Siqueira Jordao
> > <Rodrigo.Siqueira@amd.com> wrote:
> > > Hi,
> > >
> > > I also tried it with 6900XT. I got the same results on my side.
> >
> > This is weird.
> >
> > > Anyway, I could not reproduce the issue with the below components. I =
may
> > > be missing something that will trigger this bug; in this sense, could
> > > you describe the following:
> > > - The display resolution and refresh rate.
> >
> > 3840x2160 and 120Hz
> > At 60Hz issue not reproduced.
> >
> > > - Are you able to reproduce this issue with DP and HDMI?
> >
> > My TV, an OLED LG C3, has only an HDMI 2.1 port.
> >
> > > - Could you provide the firmware information: sudo cat
> > > /sys/kernel/debug/dri/0/amdgpu_firmware_info
> >
> > > sudo cat /sys/kernel/debug/dri/0/amdgpu_firmware_info
> > [sudo] password for mikhail:
> > VCE feature version: 0, firmware version: 0x00000000
> > UVD feature version: 0, firmware version: 0x00000000
> > MC feature version: 0, firmware version: 0x00000000
> > ME feature version: 38, firmware version: 0x0000000e
> > PFP feature version: 38, firmware version: 0x0000000e
> > CE feature version: 38, firmware version: 0x00000003
> > RLC feature version: 1, firmware version: 0x0000001f
> > RLC SRLC feature version: 1, firmware version: 0x00000001
> > RLC SRLG feature version: 1, firmware version: 0x00000001
> > RLC SRLS feature version: 1, firmware version: 0x00000001
> > RLCP feature version: 0, firmware version: 0x00000000
> > RLCV feature version: 0, firmware version: 0x00000000
> > MEC feature version: 38, firmware version: 0x00000015
> > MEC2 feature version: 38, firmware version: 0x00000015
> > IMU feature version: 0, firmware version: 0x00000000
> > SOS feature version: 0, firmware version: 0x00000000
> > ASD feature version: 553648344, firmware version: 0x210000d8
> > TA XGMI feature version: 0x00000000, firmware version: 0x00000000
> > TA RAS feature version: 0x00000000, firmware version: 0x00000000
> > TA HDCP feature version: 0x00000000, firmware version: 0x1700003f
> > TA DTM feature version: 0x00000000, firmware version: 0x12000016
> > TA RAP feature version: 0x00000000, firmware version: 0x00000000
> > TA SECUREDISPLAY feature version: 0x00000000, firmware version: 0x00000=
000
> > SMC feature version: 0, program: 0, firmware version: 0x00544fdf (84.79=
.223)
> > SDMA0 feature version: 52, firmware version: 0x00000009
> > VCN feature version: 0, firmware version: 0x0311f002
> > DMCU feature version: 0, firmware version: 0x00000000
> > DMCUB feature version: 0, firmware version: 0x05000f00
> > TOC feature version: 0, firmware version: 0x00000007
> > MES_KIQ feature version: 0, firmware version: 0x00000000
> > MES feature version: 0, firmware version: 0x00000000
> > VPE feature version: 0, firmware version: 0x00000000
> > VBIOS version: 102-RAPHAEL-008
> >
>
> I forgot to add output for discrete GPU:
>
> > sudo cat /sys/kernel/debug/dri/1/amdgpu_firmware_info
> [sudo] password for mikhail:
> VCE feature version: 0, firmware version: 0x00000000
> UVD feature version: 0, firmware version: 0x00000000
> MC feature version: 0, firmware version: 0x00000000
> ME feature version: 44, firmware version: 0x00000040
> PFP feature version: 44, firmware version: 0x00000062
> CE feature version: 44, firmware version: 0x00000025
> RLC feature version: 1, firmware version: 0x00000060
> RLC SRLC feature version: 0, firmware version: 0x00000000
> RLC SRLG feature version: 0, firmware version: 0x00000000
> RLC SRLS feature version: 0, firmware version: 0x00000000
> RLCP feature version: 0, firmware version: 0x00000000
> RLCV feature version: 0, firmware version: 0x00000000
> MEC feature version: 44, firmware version: 0x00000076
> MEC2 feature version: 44, firmware version: 0x00000076
> IMU feature version: 0, firmware version: 0x00000000
> SOS feature version: 0, firmware version: 0x00210e64
> ASD feature version: 553648345, firmware version: 0x210000d9
> TA XGMI feature version: 0x00000000, firmware version: 0x2000000f
> TA RAS feature version: 0x00000000, firmware version: 0x1b00013e
> TA HDCP feature version: 0x00000000, firmware version: 0x1700003f
> TA DTM feature version: 0x00000000, firmware version: 0x12000016
> TA RAP feature version: 0x00000000, firmware version: 0x07000016
> TA SECUREDISPLAY feature version: 0x00000000, firmware version: 0x0000000=
0
> SMC feature version: 0, program: 0, firmware version: 0x003a5a00 (58.90.0=
)
> SDMA0 feature version: 52, firmware version: 0x00000053
> SDMA1 feature version: 52, firmware version: 0x00000053
> SDMA2 feature version: 52, firmware version: 0x00000053
> SDMA3 feature version: 52, firmware version: 0x00000053
> VCN feature version: 0, firmware version: 0x0311f002
> DMCU feature version: 0, firmware version: 0x00000000
> DMCUB feature version: 0, firmware version: 0x02020020
> TOC feature version: 0, firmware version: 0x00000000
> MES_KIQ feature version: 0, firmware version: 0x00000000
> MES feature version: 0, firmware version: 0x00000000
> VPE feature version: 0, firmware version: 0x00000000
> VBIOS version: 113-D4120100-100
>
>
> --
> Best Regards,
> Mike Gavrilov.

--0000000000005f5140061d606d94
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amd-display-fix-corruption-with-high-refresh-rat.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amd-display-fix-corruption-with-high-refresh-rat.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lyoo67610>
X-Attachment-Id: f_lyoo67610

RnJvbSA4YWFmOGRhMDdhOGI1NDJjMGEwZjRkYTI2MDFkYTA3YmVkZGZkZWIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFR1ZSwgMTYgSnVsIDIwMjQgMTI6NDk6MjUgLTA0MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kL2Rpc3BsYXk6IGZpeCBjb3JydXB0aW9uIHdpdGggaGlnaCByZWZyZXNoIHJhdGVz
IG9uCiBEQ04gMy4wCgpUaGlzIHJldmVydHMgY29tbWl0IGJjODdkNjY2YzA1YTEzZTZkNGFlMWRk
Y2U0MWZjNDNkMjU2N2I5YTIgYW5kIHRoZQpyZWdpc3RlciBjaGFuZ2VzIGZyb20gY29tbWl0IDZk
NDI3OWNiOTlhYzRmNTFkMTA0MDk1MDFkMjk5NjlmNjg3YWM4ZGMuCgpDbG9zZXM6IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzM0NzgKQ2M6IG1pa2hhaWwu
di5nYXZyaWxvdkBnbWFpbC5jb20KQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPFJvZHJpZ28uU2lxdWVp
cmFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvb3B0Yy9kY24xMC9kY24xMF9v
cHRjLmMgICAgfCAxNSArKystLS0tLS0tLS0tLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvb3B0
Yy9kY24yMC9kY24yMF9vcHRjLmMgICAgfCAxMCArKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9vcHRjL2RjbjEwL2RjbjEwX29wdGMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9vcHRjL2RjbjEwL2RjbjEwX29wdGMuYwppbmRleCA0Zjgy
MTQ2ZDk0YjEuLmYwMGQyN2I3YzZmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL29wdGMvZGNuMTAvZGNuMTBfb3B0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9vcHRjL2RjbjEwL2RjbjEwX29wdGMuYwpAQCAtOTUwLDE5ICs5NTAsMTAg
QEAgdm9pZCBvcHRjMV9zZXRfZHJyKAogCQkJCU9UR19GT1JDRV9MT0NLX09OX0VWRU5ULCAwLAog
CQkJCU9UR19TRVRfVl9UT1RBTF9NSU5fTUFTS19FTiwgMCwKIAkJCQlPVEdfU0VUX1ZfVE9UQUxf
TUlOX01BU0ssIDApOwotCi0JCS8vIFNldHVwIG1hbnVhbCBmbG93IGNvbnRyb2wgZm9yIEVPRiB2
aWEgVFJJR19BCi0JCW9wdGMtPmZ1bmNzLT5zZXR1cF9tYW51YWxfdHJpZ2dlcihvcHRjKTsKLQot
CX0gZWxzZSB7Ci0JCVJFR19VUERBVEVfNChPVEdfVl9UT1RBTF9DT05UUk9MLAotCQkJCU9UR19T
RVRfVl9UT1RBTF9NSU5fTUFTSywgMCwKLQkJCQlPVEdfVl9UT1RBTF9NSU5fU0VMLCAwLAotCQkJ
CU9UR19WX1RPVEFMX01BWF9TRUwsIDAsCi0JCQkJT1RHX0ZPUkNFX0xPQ0tfT05fRVZFTlQsIDAp
OwotCi0JCW9wdGMtPmZ1bmNzLT5zZXRfdnRvdGFsX21pbl9tYXgob3B0YywgMCwgMCk7CiAJfQor
CisJLy8gU2V0dXAgbWFudWFsIGZsb3cgY29udHJvbCBmb3IgRU9GIHZpYSBUUklHX0EKKwlvcHRj
LT5mdW5jcy0+c2V0dXBfbWFudWFsX3RyaWdnZXIob3B0Yyk7CiB9CiAKIHZvaWQgb3B0YzFfc2V0
X3Z0b3RhbF9taW5fbWF4KHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICpvcHRjLCBpbnQgdnRvdGFs
X21pbiwgaW50IHZ0b3RhbF9tYXgpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvb3B0Yy9kY24yMC9kY24yMF9vcHRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvb3B0Yy9kY24yMC9kY24yMF9vcHRjLmMKaW5kZXggNDM0MTdjZmYyYzliLi5iNDY5
NDk4NWE0MGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9vcHRj
L2RjbjIwL2RjbjIwX29wdGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
b3B0Yy9kY24yMC9kY24yMF9vcHRjLmMKQEAgLTQ1Myw2ICs0NTMsMTYgQEAgdm9pZCBvcHRjMl9z
ZXR1cF9tYW51YWxfdHJpZ2dlcihzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqb3B0YykKIHsKIAlz
dHJ1Y3Qgb3B0YyAqb3B0YzEgPSBEQ04xMFRHX0ZST01fVEcob3B0Yyk7CiAKKwkvKiBTZXQgdGhl
IG1pbi9tYXggc2VsZWN0b3JzIHVuY29uZGl0aW9uYWxseSBzbyB0aGF0CisJICogRE1DVUIgZncg
bWF5IGNoYW5nZSBPVEcgdGltaW5ncyB3aGVuIG5lY2Vzc2FyeQorCSAqIFRPRE86IFJlbW92ZSB0
aGUgdy9hIGFmdGVyIGZpeGluZyB0aGUgaXNzdWUgaW4gRE1DVUIgZmlybXdhcmUKKwkgKi8KKwlS
RUdfVVBEQVRFXzQoT1RHX1ZfVE9UQUxfQ09OVFJPTCwKKwkJCQkgT1RHX1ZfVE9UQUxfTUlOX1NF
TCwgMSwKKwkJCQkgT1RHX1ZfVE9UQUxfTUFYX1NFTCwgMSwKKwkJCQkgT1RHX0ZPUkNFX0xPQ0tf
T05fRVZFTlQsIDAsCisJCQkJIE9UR19TRVRfVl9UT1RBTF9NSU5fTUFTSywgKDEgPDwgMSkpOyAv
KiBUUklHQSAqLworCiAJUkVHX1NFVF84KE9UR19UUklHQV9DTlRMLCAwLAogCQkJT1RHX1RSSUdB
X1NPVVJDRV9TRUxFQ1QsIDIxLAogCQkJT1RHX1RSSUdBX1NPVVJDRV9QSVBFX1NFTEVDVCwgb3B0
Yy0+aW5zdCwKLS0gCjIuNDUuMgoK
--0000000000005f5140061d606d94--
