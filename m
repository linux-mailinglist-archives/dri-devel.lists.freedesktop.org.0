Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A0C28D4E
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 11:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784A610E02F;
	Sun,  2 Nov 2025 10:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G63+It9b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252FF10E02F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 10:26:27 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-654fa5780f1so74233eaf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 02:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762079186; x=1762683986; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hPH7z91/SHPTqeGI2Zb3u2B7+TDbBA+6Nni03MInLvg=;
 b=G63+It9bNpx1Ii20RSyo4+4/oTsEnUHMV6cZU2ly3t+ZeSqavHT8wn3HRSm8dIqK70
 l2i8hnfiMU+1ALGHHmILWsZQV2Y6Uz6PBbNUKjPMmfV8VX96iBHLzWfsonTYbhRBhSht
 LCfa84K7l6cxC/HCMAp4FxXGq7H+v/Pvkuww0Fepm9N48akCJQlThSE/J6G01qsPyeeM
 6SSknxExTiwM3yXu3c/iF9tyxbv6aRO8zXzxPHt6/bORJGudl6PNor6kxbBlfzd5cZmn
 MhptuNSnAC7yQwG4hS0Mqme2+e21IU6w/hWdVOfKe5H86qD6RpkfX85sPUFvSqveSNrM
 PL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762079186; x=1762683986;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hPH7z91/SHPTqeGI2Zb3u2B7+TDbBA+6Nni03MInLvg=;
 b=uBLoUvPKsExkwbs5Ou5QkE4xo81naHrQzZvLyRItV5OcBui/wSKyn+EIxDzyU6sZxD
 vfXWgA66dLpnTSkH4PJAULXgsJ+RTMj7kxlb4KeYOIfQsFOt+lI0dc/PNa8IIp8RJwxM
 AoA7p2zpcfiJV5R+kxRSO07hlgv9V2D/AUzSlRZavzczxNJOucbi/NTQyCI09ynixYVr
 M+CtHEO2qsZRAFlCynOTRBLHmhaILPorSmze1Rlta/sV79xjKbsaW7QHwc/JNhsAI2Xk
 sTXzW2GvT5feaU7vhRrYlVhgL8E2MmzhCXr0Jpm1SiMiKssvHLoGPaNZCSRIRAXFzMMp
 dl1Q==
X-Gm-Message-State: AOJu0YxhBLStrqZtRCkcHAkhM24vdvAsSwhFWsx8DRZccMQO3oVhknHR
 bb+3K2482PzYpKhF1k/oQKc0bOMnk9ksXF1Bfv/iSWfGmeFmOAvZ97nFNi0J/5CUpH8BGZU4DsL
 3RtWunMz0sgiF1Gwc92ozeob7zbjw0wzl5Z4S
X-Gm-Gg: ASbGnctyds1Fjc1DK3t5QFky8MNOGD+rTYCqOaHFwZTnv1h9uhy/czg375lFb+6Z6mR
 yQLlWLVB55BOhHaJNsxmRDC2m6puaKlYLPIWTnAGBMpdl4rm6xEGQ0BVXx7R+NQDHyMgBABICam
 bPM5H6325Zdes+xf2p9XXy/Z/OhoU8C0FtzlxA6Yk5MRoGcPjPz1WZINXHJo71IZVV98Rvbxrs8
 gfIcmApc78/1FrwTGOB0zKL9I5TH37KJ1sy8jmKSWr84goNxeI3Rerayjud
X-Google-Smtp-Source: AGHT+IESdEmV+nwzhL53FS+XasCC3nmpvjK4fRmTLpOC+MWzSdlrUIWwO871hhi0hspl4lX1EiRzAQKpuidEc8KeNXs=
X-Received: by 2002:a05:6820:c099:10b0:654:fd22:4b79 with SMTP id
 006d021491bc7-6568a671e58mr1608539eaf.3.1762079186099; Sun, 02 Nov 2025
 02:26:26 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Sun, 2 Nov 2025 05:25:49 -0500
X-Gm-Features: AWmQ_blKPgpdWXwySVFlWIsLNESdh-5ILPAMMKhOgpFgiz7fr0u6sExrPmDW3bY
Message-ID: <CAAxE2A4uEkZ7bqimf+WVC8vsQwmNU23UBuy=3YToxzZ+=J=5fQ@mail.gmail.com>
Subject: [ANNOUNCE] libdrm 2.4.128
To: xorg-announce@lists.x.org
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="000000000000f43ec106429a0765"
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

--000000000000f43ec106429a0765
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

libdrm 2.4.128 has been released.

Versions 2.4.126 and 2.4.127 contain an ABI breakage in libdrm_amdgpu.

Depending on which Mesa version or commit you use, you may see stack
smashing resulting in crashes of AMD Mesa drivers. It's recommended to
never package versions 2.4.126 and 2.4.127.


Christian K=C3=B6nig (1):
    test/amdgpu: remove amdgpu unit tests

Jesse.Zhang (1):
    amdgpu: Add parameter validation to amdgpu_bo functions to fix SIGSEGV

Marek Ol=C5=A1=C3=A1k (2):
    Revert ABI breakage "drm/amdgpu: Add user queue HQD count to hw_ip info=
"
    Bump version to 2.4.128

Mario Limonciello (2):
    amdgpu: Read model name from /proc/cpuinfo for APUs
    amdgpu: Only read /proc/cpuinfo as a fallback

Mario Limonciello (AMD) (1):
    amdgpu: Slice and dice the string for APUs

git tag: libdrm-2.4.128

https://dri.freedesktop.org/libdrm/libdrm-2.4.128.tar.xz
SHA256: 3bb35db8700c2a0b569f2c6729a53f5495786856b310854c8de57782a22bddac
  libdrm-2.4.128.tar.xz

(concatenate both halves)
SHA512: b80e6be1c9d0427e1c3ffd018213d7230333f037498cf98819a8a6c50d923ad3
        472002044e010ca9dc646ef79dbca241bd47eaa992014cb7063b31cdb84037c7
  libdrm-2.4.128.tar.xz

PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.128.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEE86UtuOzp654zvEjGkXo+6XoPzRoFAmkHLzgACgkQkXo+6XoP
zRr5vQwApi0CRI/+uKxUnerBbSkj8mCrKxlEZVkMwGTfthBCSPtCNOz1borMhDJL
T7xNKLWLqfgXS9q52M8DdfhZo9ROXPtMmPiP3Lp2j+SNKGu6urVCwFoZx5PJzllP
d4fiufyetahq83CQZO4nCKv6CbIf+baprNtZlZHu+eNqAFN0862zbE3InhFtM/ar
TcUs0z6xB41RDZ8F3MLCx+Ry2Vd0/3raZ7SSprIhrmAfwI4I/wcBLrrOWV0KPC+k
he/pAHigQkz7CyglqcIKEej73HYATQ+bgNRRMrLKvkgD+XInlL74WUwP0daEGtpm
f8EJjsJfUioR3Gu/VBZw2Bg9OcUtETnnreA3KOUvvLfycOUEPgBXPRSFIfrxmCXY
iHXT4VpvB4RYV6kW7eSOwoNluHNeVCXRFzCUI4VunALAxuVZbfqAA6FbFHQ40XlE
o08FgUGKhQVJKqzkgC19Ye9kmMk4ag3HLFOiuLqsRKht3tRP1a6hYvt2I+O/zJ8x
N2TkFSaq
=3Dkkag
-----END PGP SIGNATURE-----

--000000000000f43ec106429a0765
Content-Type: text/plain; charset="UTF-8"; name="announce.txt.asc"
Content-Disposition: attachment; filename="announce.txt.asc"
Content-Transfer-Encoding: base64
Content-ID: <f_mhhkf3l90>
X-Attachment-Id: f_mhhkf3l90

LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQpIYXNoOiBTSEE1MTIKCmxpYmRybSAy
LjQuMTI4IGhhcyBiZWVuIHJlbGVhc2VkLgoKVmVyc2lvbnMgMi40LjEyNiBhbmQgMi40LjEyNyBj
b250YWluIGFuIEFCSSBicmVha2FnZSBpbiBsaWJkcm1fYW1kZ3B1LgoKRGVwZW5kaW5nIG9uIHdo
aWNoIE1lc2EgdmVyc2lvbiBvciBjb21taXQgeW91IHVzZSwgeW91IG1heSBzZWUgc3RhY2sKc21h
c2hpbmcgcmVzdWx0aW5nIGluIGNyYXNoZXMgb2YgQU1EIE1lc2EgZHJpdmVycy4gSXQncyByZWNv
bW1lbmRlZCB0bwpuZXZlciBwYWNrYWdlIHZlcnNpb25zIDIuNC4xMjYgYW5kIDIuNC4xMjcuCgoK
Q2hyaXN0aWFuIEvDtm5pZyAoMSk6CiAgICB0ZXN0L2FtZGdwdTogcmVtb3ZlIGFtZGdwdSB1bml0
IHRlc3RzCgpKZXNzZS5aaGFuZyAoMSk6CiAgICBhbWRncHU6IEFkZCBwYXJhbWV0ZXIgdmFsaWRh
dGlvbiB0byBhbWRncHVfYm8gZnVuY3Rpb25zIHRvIGZpeCBTSUdTRUdWCgpNYXJlayBPbMWhw6Fr
ICgyKToKICAgIFJldmVydCBBQkkgYnJlYWthZ2UgImRybS9hbWRncHU6IEFkZCB1c2VyIHF1ZXVl
IEhRRCBjb3VudCB0byBod19pcCBpbmZvIgogICAgQnVtcCB2ZXJzaW9uIHRvIDIuNC4xMjgKCk1h
cmlvIExpbW9uY2llbGxvICgyKToKICAgIGFtZGdwdTogUmVhZCBtb2RlbCBuYW1lIGZyb20gL3By
b2MvY3B1aW5mbyBmb3IgQVBVcwogICAgYW1kZ3B1OiBPbmx5IHJlYWQgL3Byb2MvY3B1aW5mbyBh
cyBhIGZhbGxiYWNrCgpNYXJpbyBMaW1vbmNpZWxsbyAoQU1EKSAoMSk6CiAgICBhbWRncHU6IFNs
aWNlIGFuZCBkaWNlIHRoZSBzdHJpbmcgZm9yIEFQVXMKCmdpdCB0YWc6IGxpYmRybS0yLjQuMTI4
CgpodHRwczovL2RyaS5mcmVlZGVza3RvcC5vcmcvbGliZHJtL2xpYmRybS0yLjQuMTI4LnRhci54
egpTSEEyNTY6IDNiYjM1ZGI4NzAwYzJhMGI1NjlmMmM2NzI5YTUzZjU0OTU3ODY4NTZiMzEwODU0
YzhkZTU3NzgyYTIyYmRkYWMKICBsaWJkcm0tMi40LjEyOC50YXIueHoKCihjb25jYXRlbmF0ZSBi
b3RoIGhhbHZlcykKU0hBNTEyOiBiODBlNmJlMWM5ZDA0MjdlMWMzZmZkMDE4MjEzZDcyMzAzMzNm
MDM3NDk4Y2Y5ODgxOWE4YTZjNTBkOTIzYWQzCiAgICAgICAgNDcyMDAyMDQ0ZTAxMGNhOWRjNjQ2
ZWY3OWRiY2EyNDFiZDQ3ZWFhOTkyMDE0Y2I3MDYzYjMxY2RiODQwMzdjNwogIGxpYmRybS0yLjQu
MTI4LnRhci54egoKUEdQOiAgaHR0cHM6Ly9kcmkuZnJlZWRlc2t0b3Aub3JnL2xpYmRybS9saWJk
cm0tMi40LjEyOC50YXIueHouc2lnCgotLS0tLUJFR0lOIFBHUCBTSUdOQVRVUkUtLS0tLQoKaVFH
ekJBRUJDZ0FkRmlFRTg2VXR1T3pwNjU0enZFakdrWG8rNlhvUHpSb0ZBbWtITHpnQUNna1FrWG8r
NlhvUAp6UnI1dlF3QXBpMENSSS8rdUt4VW5lckJiU2tqOG1Dckt4bEVaVmtNd0dUZnRoQkNTUHRD
Tk96MWJvck1oREpMClQ3eE5LTFdMcWZnWFM5cTUyTThEZGZoWm85Uk9YUHRNbVBpUDNMcDJqK1NO
S0d1NnVyVkN3Rm9aeDVQSnpsbFAKZDRmaXVmeWV0YWhxODNDUVpPNG5DS3Y2Q2JJZitiYXByTnRa
bFpIdStlTnFBRk4wODYyemJFM0luaEZ0TS9hcgpUY1VzMHo2eEI0MVJEWjhGM01MQ3grUnkyVmQw
LzNyYVo3U1Nwcklocm1BZndJNEkvd2NCTHJyT1dWMEtQQytrCmhlL3BBSGlnUWt6N0N5Z2xxY0lL
RWVqNzNIWUFUUStiZ05SUk1yTEt2a2dEK1hJbmxMNzRXVXdQMGRhRUd0cG0KZjhFSmpzSmZVaW9S
M0d1L1ZCWncyQmc5T2NVdEVUbm5yZUEzS09VdnZMZnljT1VFUGdCWFBSU0ZJZnJ4bUNYWQppSFhU
NFZwdkI0UllWNmtXN2VTT3dvTmx1SE5lVkNYUkZ6Q1VJNFZ1bkFMQXh1VlpiZnFBQTZGYkZIUTQw
WGxFCm8wOEZnVUdLaFFWSktxemtnQzE5WWU5a21NazRhZzNITEZPaXVMcXNSS2h0M3RSUDFhNmhZ
dnQySStPL3pKOHgKTjJUa0ZTYXEKPWtrYWcKLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tCg==
--000000000000f43ec106429a0765--
