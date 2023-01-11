Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35D86653FC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 06:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D739C10E6EA;
	Wed, 11 Jan 2023 05:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E4510E6EA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 05:49:14 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ud5so34230931ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 21:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nCkx24rYsX/gB9OYEJowvMcZKBHg/IhH9ZKToxTa0i8=;
 b=jFeTubjNlsfNfuTXXJMu/DFJMFRGs5yKHuKzunX+QNfa3yzbRLnLxVz0Ki7rTioAFA
 9dfU/fIpBeQE2/ioY7gEdWqJwEFjznzS0CStSUOXQyZmnPNGuWhbnt+Drngi7TNEWI2q
 c4MdPZ+OQM4IQReZuXWfaNR+9TAK0GFVjSB7i4PYPvoq75GXzI+7MVQCrzVIA191wDWz
 DJzGUJSr7atHor2strS68EPY6IH+rQ0/qek0GHiijP+3Q0J+LbsxVDn0j9S/HGhApZPV
 0iN/cg8OVw8w6MTr/s2PotJpNE/y3mH0+o1b+alV2CETAwOHbwdqUq4tfsmwsasxmGXS
 /eRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nCkx24rYsX/gB9OYEJowvMcZKBHg/IhH9ZKToxTa0i8=;
 b=nKGfRZRLDB3tcTQq3KJftl1UpXrh2u+fx5HCovOwb67bsJnzMDwZ3Rej4Fy9Lreg1B
 jvzgKEXXDcvX1kFqr/w1ekAvM/Yhq5h5wb3mv8qrTcdl6qvMBGjrVtxRX2gNEO0IpGrv
 Q1Xvgw7NsdIC8geKSgCurOfrj9EJaqPUUXFF+q1ApnTCfGZDMD1wdW4W9q0nUCu7QnY9
 0vAuP8v71tQ8rSXYOS9Y8A3uT89bsCqQqFZADnke9mTU0mGr6yf7ovjkVUOip5u9sa93
 Phj7R71cffIE7abYzG/EyenGZwwckJwVE0bvzevbrZuD4AnfzOYf/WAHzDstlj4HO513
 JDDw==
X-Gm-Message-State: AFqh2kq0ISShtR0QXKusiPLKBrIt6s3Bv0QkSsqZafOYfEcv/4WJT/ia
 HM2SUat1gtRf6+loa/e7xal4HISWGeq/Cu9UAkCQjAs+kRg=
X-Google-Smtp-Source: AMrXdXuRbNxmuv+su+Nx8wp0+xEdcspbwx5ADE2asCmNKFvaP0hKZn2pLIJ7qlIrcRc6YBksMOb2qMGtoKsK+PQnJRY=
X-Received: by 2002:a17:907:d310:b0:84d:43ec:591f with SMTP id
 vg16-20020a170907d31000b0084d43ec591fmr916233ejc.362.1673416152995; Tue, 10
 Jan 2023 21:49:12 -0800 (PST)
MIME-Version: 1.0
From: appu s <appushan131186@gmail.com>
Date: Wed, 11 Jan 2023 11:19:01 +0530
Message-ID: <CAJoGAmRoQ0rCSMngod6QZKbHs_ojuiGLB0fQ3L1Qx0ri4Mx9Gw@mail.gmail.com>
Subject: Request for info regarding mst connected devices
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="0000000000005c70e705f1f68fce"
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
Cc: laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000005c70e705f1f68fce
Content-Type: multipart/alternative; boundary="0000000000005c70e505f1f68fcc"

--0000000000005c70e505f1f68fcc
Content-Type: text/plain; charset="UTF-8"

Dear All,

Happy new year! and very glad to meet you all!, as I am newbie to DRM
susbsytem, seeking for some help please, in understanding some of the below
info regarding DRM

1. May I know please , what could be going wrong based on the attached
errors, any debug information, like anywhere can I print the atomic states.
What is the api to do that please? or  that I can add further to narrow
down the below errors please ? & may I know what is the connection between
these 2 signatures below please?

[  165.434510] RIP: 0010:drm_dp_atomic_release_vcpi_slots+0x90/0xb4

[  165.434849] RIP: 0010:drm_framebuffer_remove+0x34d/0x478

I see the above issue, when I unplugged the same mst dock with external
displays connected which was plugged initially.

2. trying to understand the below api, "drm_dp_atomic_release_vcpi_slots",
could anyone please correct if my understanding is incorrect please based
on comment below:

/**
 * drm_dp_atomic_release_vcpi_slots() - Release allocated vcpi slots
 * @state: global atomic state
 * @mgr: MST topology manager for the port
 * @port: The port to release the VCPI slots from
 *
 * Releases any VCPI slots that have been allocated to a port in the atomic
 * state. Any atomic drivers which support MST must call this function in
 * their &drm_connector_helper_funcs.atomic_check() callback when the
 * connector will no longer have VCPI allocated (e.g. because its CRTC was
 * removed) when it had VCPI allocated in the previous atomic state.
 *
 * It is OK to call this even if @port has been removed from the system.
 * Additionally, it is OK to call this function multiple times on the same
 * @port as needed. It is not OK however, to call this function and
 * drm_dp_atomic_find_vcpi_slots() on the same @port in a single atomic
check
 * phase.
 *
 * See also:
 * drm_dp_atomic_find_vcpi_slots()
 * drm_dp_mst_atomic_check()
 *
 * Returns:
 * 0 if all slots for this port were added back to
 * &drm_dp_mst_topology_state.avail_slots or negative error code
 */

1. The term "vcpi slots" is equivalent to here is the number of display
devices connected over mst?

2. somewhere vcpi allocation is not getting freed, any quick tweaks or
hacks please, how can I quickly try to release or free vcpi allocations,
when it is removed or unplugged, but my worries is whether any of it is
previous atomic state would get affected or impacts or cause any issues due
to its freeing?

3. Could anyone please once again explain this portion of the comment "It
is not OK however, to call this function and
 * drm_dp_atomic_find_vcpi_slots() on the same @port in a single atomic
check
 * phase."?

Many thanks in advance,

--0000000000005c70e505f1f68fcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear All,<div><br></div><div>Happy new year! and very glad=
 to meet you all!, as I am newbie to DRM susbsytem, seeking for some help p=
lease, in understanding some of the below info regarding DRM</div><div><br>=
</div><div>1. May I know please , what could be going wrong based on the at=
tached errors, any debug information, like anywhere can I print the atomic =
states. What is the api to do that please? or=C2=A0=C2=A0that I can add fur=
ther to narrow down the below errors please ? &amp; may I know what is the =
connection between these 2 signatures below please?</div><div><br></div><di=
v>[ =C2=A0165.434510] RIP: 0010:drm_dp_atomic_release_vcpi_slots+0x90/0xb4<=
/div><div><br></div><div>[ =C2=A0165.434849] RIP: 0010:drm_framebuffer_remo=
ve+0x34d/0x478<br></div><div><br></div><div>I see the above issue, when I u=
nplugged the same mst dock with external displays connected which was plugg=
ed initially.</div><div><br></div><div>2. trying to understand the below ap=
i, &quot;drm_dp_atomic_release_vcpi_slots&quot;, could anyone please correc=
t if my understanding is incorrect please based on comment below:</div><div=
><br></div><div>/**<br>=C2=A0* drm_dp_atomic_release_vcpi_slots() - Release=
 allocated vcpi slots<br>=C2=A0* @state: global atomic state<br>=C2=A0* @mg=
r: MST topology manager for the port<br>=C2=A0* @port: The port to release =
the VCPI slots from<br>=C2=A0*<br>=C2=A0* Releases any VCPI slots that have=
 been allocated to a port in the atomic<br>=C2=A0* state. Any atomic driver=
s which support MST must call this function in<br>=C2=A0* their &amp;drm_co=
nnector_helper_funcs.atomic_check() callback when the<br>=C2=A0* connector =
will no longer have VCPI allocated (e.g. because its CRTC was<br>=C2=A0* re=
moved) when it had VCPI allocated in the previous atomic state.<br>=C2=A0*<=
br>=C2=A0* It is OK to call this even if @port has been removed from the sy=
stem.<br>=C2=A0* Additionally, it is OK to call this function multiple time=
s on the same<br>=C2=A0* @port as needed. It is not OK however, to call thi=
s function and<br>=C2=A0* drm_dp_atomic_find_vcpi_slots() on the same @port=
 in a single atomic check<br>=C2=A0* phase.<br>=C2=A0*<br>=C2=A0* See also:=
<br>=C2=A0* drm_dp_atomic_find_vcpi_slots()<br>=C2=A0* drm_dp_mst_atomic_ch=
eck()<br>=C2=A0*<br>=C2=A0* Returns:<br>=C2=A0* 0 if all slots for this por=
t were added back to<br>=C2=A0* &amp;drm_dp_mst_topology_state.avail_slots =
or negative error code<br>=C2=A0*/<br></div><div><br></div><div>1. The term=
 &quot;vcpi slots&quot; is equivalent to here is the number of display devi=
ces connected over mst?</div><div><br></div><div>2. somewhere vcpi allocati=
on is not getting freed, any quick tweaks or hacks please, how can I quickl=
y try to release or free vcpi allocations, when it is removed or unplugged,=
 but my worries is whether any of it is previous atomic state would get aff=
ected or impacts or cause any issues due to its freeing?<br></div><div><br>=
</div><div>3. Could anyone please once again explain this portion of the co=
mment &quot;It is not OK however, to call this function and</div>=C2=A0* dr=
m_dp_atomic_find_vcpi_slots() on the same @port in a single atomic check<br=
>=C2=A0* phase.&quot;?<div><br></div><div>Many thanks in advance,<br><div><=
br></div><div><br><div><br></div><div><br></div></div></div></div>

--0000000000005c70e505f1f68fcc--

--0000000000005c70e705f1f68fce
Content-Type: text/plain; charset="US-ASCII"; name="vcpi_slots_error.txt"
Content-Disposition: attachment; filename="vcpi_slots_error.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_lcr6zqwz0>
X-Attachment-Id: f_lcr6zqwz0

WyAgMTY1LjQzNDM0Ml0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQpbICAx
NjUuNDM0MzUyXSBbZHJtOmN1c3RvbXNvY19paF9wcm9jZXNzXSBjdXN0b21zb2NfaWhfcHJvY2Vz
czogcnB0ciAyMDgzMiwgd3B0ciAyMDg2NA0KWyAgMTY1LjQzNDM1MF0gV0FSTklORzogQ1BVOiAw
IFBJRDogNjIwNyBhdCBkcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmM6NDQ4MyBkcm1fZHBfYXRvbWljX3JlbGVhc2VfdmNwaV9zbG90cysweDkwLzB4YjQNClsgIDE2
NS40MzQzNjBdIE1vZHVsZXMgbGlua2VkIGluOiByODE1M19lY20gc25kX3VzYl9hdWRpbyBzbmRf
dXNibWlkaV9saWIgc25kX3Jhd21pZGkgc25kX3NlcV9kdW1teSBzbmRfc2VxIHNuZF9zZXFfZGV2
aWNlIG9wdGlvbiBjZGNfbWJpbSB1c2Jfd3dhbiB1c2JzZXJpYWwNClsgIDE2NS40MzQzNzRdIFtk
cm06Y3VzdG9tc29jX2dldF92YmxhbmtfY291bnRlcl9rbXNdIGNydGMgMjogZGlzdCBmcm9tIHZi
bGFuayBzdGFydCA1DQpbICAxNjUuNDM0MzgwXSAgY2RjX3dkbSBjZGNfbmNtIGJyaWRnZSBzdHAN
ClsgIDE2NS40MzQzODFdIGN1c3RvbXNvYyAwMDAwOjA0OjAwLjA6IFtkcm06ZHJtX2NydGNfdmJs
YW5rX2hlbHBlcl9nZXRfdmJsYW5rX3RpbWVzdGFtcF9pbnRlcm5hbF0gY3J0YyAyIDogdiBwKDE4
MTAsLTU2KUAgMTQyLjQ4ODkyNyAtPiAxNDIuNDg5MzQ0IFtlIDIgdXMsIDAgcmVwXQ0KWyAgMTY1
LjQzNDM4N10gIGxsYyB0dW4gdmhvc3RfdnNvY2sgdmhvc3QNClsgIDE2NS40MzQzOTFdIFtkcm06
Y3VzdG9tc29jZ3B1X2dldF92YmxhbmtfY291bnRlcl9rbXNdIGNydGMgMjogZGlzdCBmcm9tIHZi
bGFuayBzdGFydCA3DQpbICAxNjUuNDM0MzkxXSAgdmhvc3RfaW90bGIgdm13X3Zzb2NrX3ZpcnRp
b190cmFuc3BvcnRfY29tbW9uIHZzb2NrDQpbICAxNjUuNDM0Mzk0XSBjdXN0b21zb2NncHUgMDAw
MDowNDowMC4wOiBbZHJtOmRybV91cGRhdGVfdmJsYW5rX2NvdW50XSB1cGRhdGluZyB2Ymxhbmsg
Y291bnQgb24gY3J0YyAyOiBjdXJyZW50PTU2NTAsIGRpZmY9MSwgaHc9MTE5MCBod19sYXN0PTEx
ODkNClsgIDE2NS40MzQzOThdICA4MDIxcSByZmNvbW0gY21hYyBhbGdpZl9oYXNoIGFsZ2lmX3Nr
Y2lwaGVyIGFmX2FsZyB2ZXRoIHVpbnB1dCB4dF9jZ3JvdXAgc25kX2FjcF9zb2ZfbWFjaCBzbmRf
YWNwX21hY2ggc25kX3NvY19kbWljIHh0X01BU1FVRVJBREUgc25kX2hkYV9jb2RlY19oZG1pIHNu
ZF9oZGFfaW50ZWwgYnR1c2Igc25kX3NvZl9jdXN0b21zb2NfcmVtYnJhbmR0IHNuZF9pbnRlbF9k
c3BjZmcgYnRydGwgc25kX3NvZl9jdXN0b21zb2NfYWNwIHNuZF9oZGFfY29kZWMgYnRpbnRlbCBi
dG10ayBzbmRfc29mX3h0ZW5zYV9kc3Agc25kX3NvZl9wY2kgc25kX2h3ZGVwIGJ0YmNtIHNuZF9z
b2Ygc25kX3NvZl91dGlscyBzbmRfaGRhX2NvcmUgc25kX3JuX3BjaV9hY3AzeCBzbmRfYWNwX2Nv
bmZpZyBzbmRfc29jX2FjcGkgc25kX3BjaV9hY3AzeCBjZGNfZXRoZXIgdXNibmV0IGkyY19waWl4
NCBzbmRfc29jX3J0NTY4MnMgc25kX3NvY19ydDEwMTkgc25kX3NvY19ybDYyMzEgaXA2dGFibGVf
bmF0IGZ1c2UgcnR3ODlfODg1MmNlIHJ0dzg5Xzg4NTJjIHJ0dzg5X3BjaSBydHc4OV9jb3JlIGlp
b190cmlnX3N5c2ZzIG1hYzgwMjExIGNyb3NfZWNfbGlkX2FuZ2xlIGNyb3NfZWNfc2Vuc29ycyBj
cm9zX2VjX3NlbnNvcnNfY29yZSBpbmR1c3RyaWFsaW9fdHJpZ2dlcmVkX2J1ZmZlciBrZmlmb19i
dWYgYmx1ZXRvb3RoIGluZHVzdHJpYWxpbyByODE1MiBjZmc4MDIxMSBlY2RoX2dlbmVyaWMgZWNj
IGNyb3NfZWNfc2Vuc29yaHViIG1paSBsem9fcmxlIGx6b19jb21wcmVzcyB6cmFtIHV2Y3ZpZGVv
IHZpZGVvYnVmMl92bWFsbG9jIHZpZGVvYnVmMl9tZW1vcHMgdmlkZW9idWYyX3Y0bDIgdmlkZW9i
dWYyX2NvbW1vbiBqb3lkZXYNClsgIDE2NS40MzQ0ODddIENQVTogMCBQSUQ6IDYyMDcgQ29tbTog
a3dvcmtlci8wOjMxIFRhaW50ZWQ6IEcgICAgICAgIFcgICAgICAgICA1LjE1Ljg2LTE1NzE3LWdh
NDMzMjRhMzMyMzctZGlydHkgIzIzIGY3MmI0Nzk3YjQxYzEzNGQ0MzM0OTgzZTE1NGQyZTg3OGY5
OTI1ZDYNClsgIDE2NS40MzQ1MDFdIFdvcmtxdWV1ZTogZXZlbnRzIGRybV9tb2RlX3JtZmJfd29y
a19mbg0KWyAgMTY1LjQzNDUxMF0gUklQOiAwMDEwOmRybV9kcF9hdG9taWNfcmVsZWFzZV92Y3Bp
X3Nsb3RzKzB4OTAvMHhiNA0KWyAgMTY1LjQzNDUxNl0gQ29kZTogZjEgYjEgZmQgZmYgODMgN2Ig
ZjAgMDAgNzQgMTAgNGMgODkgZTcgZTggZjYgZDIgZmYgZmYgNDggYzcgNDMgZjAgMDAgMDAgMDAg
MDAgNDQgODkgZjAgNWIgNDEgNWMgNDEgNWUgNDEgNWYgNWQgZTkgMGIgNzIgYjggMDAgPDBmPiAw
YiA0OSA4YiA0NyA1OCA0OCA4YiA3OCAwOCA0OCBjNyBjNiBmNyAxOSA0NSA4ZCA0YyA4OSBlMiA0
YyA4OQ0KWyAgMTY1LjQzNDUyMV0gUlNQOiAwMDE4OmZmZmY5MzlhMDNmNTNiMjAgRUZMQUdTOiAw
MDAxMDI0Ng0KWyAgMTY1LjQzNDUyNl0gUkFYOiBmZmZmOGFhNDhjMDI4YjUwIFJCWDogZmZmZjhh
YTQ4YzAyOGI1MCBSQ1g6IGJkODUxZDUwMzgwZmNlMDANClsgIDE2NS40MzQ1MzFdIFJEWDogMDAw
MDAwMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAwZmY3ZmZmZmYgUkRJOiAwMDAwMDAwMDAwMDAwMDAx
DQpbICAxNjUuNDM0NTM0XSBSQlA6IGZmZmY5MzlhMDNmNTNiNDAgUjA4OiAwMDAwMDAwMDAwMDAw
MDAwIFIwOTogZmZmZjkzOWEwM2Y1Mzc1OA0KWyAgMTY1LjQzNDUzOF0gUjEwOiAwMDAwMDAwMGZm
N2ZmZmZmIFIxMTogZmZmZjhhYTY3NjM0MDAwMCBSMTI6IGZmZmY4YWE2MGM1NzU4MDANClsgIDE2
NS40MzQ1NDFdIFIxMzogZmZmZjhhYTVjZWI0NjAwMCBSMTQ6IGZmZmY4YWE0OGMwMjhiNDAgUjE1
OiBmZmZmOGFhNTgzNmVjN2IwDQpbICAxNjUuNDM0NTQ2XSBGUzogIDAwMDAwMDAwMDAwMDAwMDAo
MDAwMCkgR1M6ZmZmZjhhYTY2ZTAwMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQpb
ICAxNjUuNDM0NTUxXSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgw
MDUwMDMzDQpbICAxNjUuNDM0NTU1XSBDUjI6IDAwMDA3NGQ1NDI4MGUwMDAgQ1IzOiAwMDAwMDAw
MTE2NGI4MDAwIENSNDogMDAwMDAwMDAwMDM1MGVmMA0KWyAgMTY1LjQzNDU2MF0gQ2FsbCBUcmFj
ZToNClsgIDE2NS40MzQ1NzBdICA8VEFTSz4NClsgIDE2NS40MzQ1NzldICBkcm1fYXRvbWljX2hl
bHBlcl9jaGVja19tb2Rlc2V0KzB4NTA0LzB4OTIzDQpbICAxNjUuNDM0NTg2XSAgY3VzdG9tc29j
Z3B1X2RtX2F0b21pY19jaGVjaysweGFkLzB4YzJlDQpbICAxNjUuNDM0NTk0XSAgPyBfZGV2X3By
aW50aysweDYwLzB4N2UNClsgIDE2NS40MzQ2MDJdICA/IGRybV9hdG9taWNfY2hlY2tfb25seSsw
eDQzLzB4OThmDQpbICAxNjUuNDM0NjA5XSAgZHJtX2F0b21pY19jaGVja19vbmx5KzB4M2VlLzB4
OThmDQpbICAxNjUuNDM0NjE2XSAgPyBkcm1fYXRvbWljX2Nvbm5lY3Rvcl9wcmludF9zdGF0ZSsw
eDYzLzB4YmYNClsgIDE2NS40MzQ2MjNdICBkcm1fYXRvbWljX2NvbW1pdCsweGEyLzB4MTA1DQpb
ICAxNjUuNDM0NjMwXSAgPyBfX2RybV9wcmludGZuX2luZm8rMHgxZC8weDFkDQpbICAxNjUuNDM0
NjM2XSAgZHJtX2ZyYW1lYnVmZmVyX3JlbW92ZSsweDI5OS8weDQ3OA0KWyAgMTY1LjQzNDY0NF0g
IGRybV9tb2RlX3JtZmJfd29ya19mbisweDc2LzB4ODYNClsgIDE2NS40MzQ2NTFdICBwcm9jZXNz
X29uZV93b3JrKzB4MWRhLzB4MzQyDQpbICAxNjUuNDM0NjU5XSAgd29ya2VyX3RocmVhZCsweDI1
Yy8weDM3Mw0KWyAgMTY1LjQzNDY2NV0gIGt0aHJlYWQrMHgxM2QvMHgxNTMNClsgIDE2NS40MzQ2
NzFdICA/IHByX2NvbnRfd29yaysweDU0LzB4NTQNClsgIDE2NS40MzQ2NzRdICA/IGt0aHJlYWRf
YmxrY2crMHgzMS8weDMxDQpbICAxNjUuNDM0NjgwXSAgcmV0X2Zyb21fZm9yaysweDIyLzB4MzAN
ClsgIDE2NS40MzQ2ODldICA8L1RBU0s+DQpbICAxNjUuNDM0NjkyXSAtLS1bIGVuZCB0cmFjZSBj
YmFiOTU3ZTc1MzA5NDYzIF0tLS0NClsgIDE2NS40MzQ2OTddIGN1c3RvbXNvY2dwdSAwMDAwOjA0
OjAwLjA6IFtkcm1dICpFUlJPUiogbm8gVkNQSSBmb3IgW01TVCBQT1JUOjAwMDAwMDAwNTJhY2Ux
ODZdIGZvdW5kIGluIG1zdCBzdGF0ZSAwMDAwMDAwMDJlMjVhMjFlDQpbICAxNjUuNDM0NzAzXSBb
ZHJtOmN1c3RvbXNvY2dwdV9kbV9hdG9taWNfY2hlY2tdIGRybV9hdG9taWNfaGVscGVyX2NoZWNr
X21vZGVzZXQoKSBmYWlsZWQNClsgIDE2NS40MzQ3MDldIFtkcm06Y3VzdG9tc29jZ3B1X2RtX2F0
b21pY19jaGVja10gQXRvbWljIGNoZWNrIGZhaWxlZCB3aXRoIGVycjogLTIyDQpbICAxNjUuNDM0
NzE0XSBjdXN0b21zb2NncHUgMDAwMDowNDowMC4wOiBbZHJtOmRybV9hdG9taWNfY2hlY2tfb25s
eV0gYXRvbWljIGRyaXZlciBjaGVjayBmb3IgMDAwMDAwMDBlZmI2NzNkMSBmYWlsZWQ6IC0yMg0K
WyAgMTY1LjQzNDcxOV0gY3VzdG9tc29jZ3B1IDAwMDA6MDQ6MDAuMDogW2RybTpkcm1fYXRvbWlj
X3N0YXRlX2RlZmF1bHRfY2xlYXJdIENsZWFyaW5nIGF0b21pYyBzdGF0ZSAwMDAwMDAwMGVmYjY3
M2QxDQpbICAxNjUuNDM0NzI0XSBbZHJtOmRybV9tb2RlX29iamVjdF9wdXRdIE9CSiBJRDogMTE5
ICgyKQ0KWyAgMTY1LjQzNDcyN10gW2RybTpkcm1fbW9kZV9vYmplY3RfcHV0XSBPQkogSUQ6IDEx
NyAoMykNClsgIDE2NS40MzQ3MzFdIGN1c3RvbXNvY2dwdSAwMDAwOjA0OjAwLjA6IFtkcm06X19k
cm1fYXRvbWljX3N0YXRlX2ZyZWVdIEZyZWVpbmcgYXRvbWljIHN0YXRlIDAwMDAwMDAwZWZiNjcz
ZDENClsgIDE2NS40MzQ3MzVdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0K
WyAgMTY1LjQzNDczOV0gYXRvbWljIHJlbW92ZV9mYiBmYWlsZWQgd2l0aCAtMjINClsgIDE2NS40
MzQ3NTBdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDYyMDcgYXQgZHJpdmVycy9ncHUvZHJtL2RybV9m
cmFtZWJ1ZmZlci5jOjExMzAgZHJtX2ZyYW1lYnVmZmVyX3JlbW92ZSsweDM0ZC8weDQ3OA0KWyAg
MTY1LjQzNDc1N10gTW9kdWxlcyBsaW5rZWQgaW46IHI4MTUzX2VjbSBzbmRfdXNiX2F1ZGlvIHNu
ZF91c2JtaWRpX2xpYiBzbmRfcmF3bWlkaSBzbmRfc2VxX2R1bW15IHNuZF9zZXEgc25kX3NlcV9k
ZXZpY2Ugb3B0aW9uIGNkY19tYmltIHVzYl93d2FuIHVzYnNlcmlhbCBjZGNfd2RtIGNkY19uY20g
YnJpZGdlIHN0cCBsbGMgdHVuIHZob3N0X3Zzb2NrIHZob3N0IHZob3N0X2lvdGxiIHZtd192c29j
a192aXJ0aW9fdHJhbnNwb3J0X2NvbW1vbiB2c29jayA4MDIxcSByZmNvbW0gY21hYyBhbGdpZl9o
YXNoIGFsZ2lmX3NrY2lwaGVyIGFmX2FsZyB2ZXRoIHVpbnB1dCB4dF9jZ3JvdXAgc25kX2FjcF9z
b2ZfbWFjaCBzbmRfYWNwX21hY2ggc25kX3NvY19kbWljIHh0X01BU1FVRVJBREUgc25kX2hkYV9j
b2RlY19oZG1pIHNuZF9oZGFfaW50ZWwgYnR1c2Igc25kX3NvZl9jdXN0b21zb2NfcmVtYnJhbmR0
IHNuZF9pbnRlbF9kc3BjZmcgYnRydGwgc25kX3NvZl9jdXN0b21zb2NfYWNwIHNuZF9oZGFfY29k
ZWMgYnRpbnRlbCBidG10ayBzbmRfc29mX3h0ZW5zYV9kc3Agc25kX3NvZl9wY2kgc25kX2h3ZGVw
IGJ0YmNtIHNuZF9zb2Ygc25kX3NvZl91dGlscyBzbmRfaGRhX2NvcmUgc25kX3JuX3BjaV9hY3Az
eCBzbmRfYWNwX2NvbmZpZyBzbmRfc29jX2FjcGkgc25kX3BjaV9hY3AzeCBjZGNfZXRoZXIgdXNi
bmV0IGkyY19waWl4NCBzbmRfc29jX3J0NTY4MnMgc25kX3NvY19ydDEwMTkgc25kX3NvY19ybDYy
MzEgaXA2dGFibGVfbmF0IGZ1c2UgcnR3ODlfODg1MmNlIHJ0dzg5Xzg4NTJjIHJ0dzg5X3BjaSBy
dHc4OV9jb3JlIGlpb190cmlnX3N5c2ZzIG1hYzgwMjExIGNyb3NfZWNfbGlkX2FuZ2xlIGNyb3Nf
ZWNfc2Vuc29ycyBjcm9zX2VjX3NlbnNvcnNfY29yZSBpbmR1c3RyaWFsaW9fdHJpZ2dlcmVkX2J1
ZmZlciBrZmlmb19idWYgYmx1ZXRvb3RoIGluZHVzdHJpYWxpbyByODE1MiBjZmc4MDIxMSBlY2Ro
X2dlbmVyaWMgZWNjIGNyb3NfZWNfc2Vuc29yaHViIG1paSBsem9fcmxlDQpbICAxNjUuNDM0ODIy
XSAgbHpvX2NvbXByZXNzIHpyYW0gdXZjdmlkZW8gdmlkZW9idWYyX3ZtYWxsb2MgdmlkZW9idWYy
X21lbW9wcyB2aWRlb2J1ZjJfdjRsMiB2aWRlb2J1ZjJfY29tbW9uIGpveWRldg0KWyAgMTY1LjQz
NDgzNF0gQ1BVOiAwIFBJRDogNjIwNyBDb21tOiBrd29ya2VyLzA6MzEgVGFpbnRlZDogRyAgICAg
ICAgVyAgICAgICAgIDUuMTUuODYtMTU3MTctZ2E0MzMyNGEzMzIzNy1kaXJ0eSAjMjMgZjcyYjQ3
OTdiNDFjMTM0ZDQzMzQ5ODNlMTU0ZDJlODc4Zjk5MjVkNg0KWyAgMTY1LjQzNDg0M10gV29ya3F1
ZXVlOiBldmVudHMgZHJtX21vZGVfcm1mYl93b3JrX2ZuDQpbICAxNjUuNDM0ODQ5XSBSSVA6IDAw
MTA6ZHJtX2ZyYW1lYnVmZmVyX3JlbW92ZSsweDM0ZC8weDQ3OA0KWyAgMTY1LjQzNDg1NF0gQ29k
ZTogODkgZWYgYmUgMDMgMDAgMDAgMDAgZTggNmEgNTggZWEgZmYgZWIgYmUgNDUgODUgZTQgNDgg
OGIgNWQgODggMGYgODQgMDAgMDEgMDAgMDAgNDggYzcgYzcgZTIgYWEgNGUgOGQgNDQgODkgZTYg
ZTggMTggMTAgYWMgZmYgPDBmPiAwYiBlOSBlYSAwMCAwMCAwMCA0YyA4YiAzMyA0YyA4OSBmNyBl
OCBlNiBiMSBmZiBmZiA0ZCA4ZCBiZSBkOA0KWyAgMTY1LjQzNDg1OV0gUlNQOiAwMDE4OmZmZmY5
MzlhMDNmNTNkYTggRUZMQUdTOiAwMDAxMDI0Ng0KWyAgMTY1LjQzNDg2Ml0gUkFYOiBiZDg1MWQ1
MDM4MGZjZTAwIFJCWDogZmZmZjhhYTQ4OGU1YWYwMCBSQ1g6IDAwMDAwMDAwMDAwMDAwMjcNClsg
IDE2NS40MzQ4NjZdIFJEWDogMDAwMDAwMDAwMDAwMDAyNyBSU0k6IDAwMDAwMDAwZmY3ZmZmZmYg
UkRJOiBmZmZmOGFhNjZlMDE2ZDg4DQpbICAxNjUuNDM0ODcwXSBSQlA6IGZmZmY5MzlhMDNmNTNl
NDAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogZmZmZjkzOWEwM2Y1M2I4MA0KWyAgMTY1LjQz
NDg3M10gUjEwOiAwMDAwMDAwMGZmN2ZmZmZmIFIxMTogZmZmZjhhYTY3NjM0MDAwMCBSMTI6IDAw
MDAwMDAwZmZmZmZmZWENClsgIDE2NS40MzQ4NzddIFIxMzogZmZmZjhhYTVhZjAyOTkwMCBSMTQ6
IDAwMDAwMDAwMDAwMDAwMDcgUjE1OiBmZmZmOTM5YTAzZjUzZGQwDQpbICAxNjUuNDM0ODgyXSBG
UzogIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjhhYTY2ZTAwMDAwMCgwMDAwKSBrbmxH
UzowMDAwMDAwMDAwMDAwMDAwDQpbICAxNjUuNDM0ODg2XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6
IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQpbICAxNjUuNDM0ODkwXSBDUjI6IDAwMDA3NGQ1
NDI4MGUwMDAgQ1IzOiAwMDAwMDAwMTE2NGI4MDAwIENSNDogMDAwMDAwMDAwMDM1MGVmMA0KWyAg
MTY1LjQzNDg5M10gQ2FsbCBUcmFjZToNClsgIDE2NS40MzQ4OTZdICA8VEFTSz4NClsgIDE2NS40
MzQ5MDBdICBkcm1fbW9kZV9ybWZiX3dvcmtfZm4rMHg3Ni8weDg2DQpbICAxNjUuNDM0OTA2XSAg
cHJvY2Vzc19vbmVfd29yaysweDFkYS8weDM0Mg0KWyAgMTY1LjQzNDkxMV0gIHdvcmtlcl90aHJl
YWQrMHgyNWMvMHgzNzMNClsgIDE2NS40MzQ5MTZdICBrdGhyZWFkKzB4MTNkLzB4MTUzDQpbICAx
NjUuNDM0OTIxXSAgPyBwcl9jb250X3dvcmsrMHg1NC8weDU0DQpbICAxNjUuNDM0OTI1XSAgPyBr
dGhyZWFkX2Jsa2NnKzB4MzEvMHgzMQ0KWyAgMTY1LjQzNDkzMV0gIHJldF9mcm9tX2ZvcmsrMHgy
Mi8weDMwDQpbICAxNjUuNDM0OTM2XSAgPC9UQVNLPg0KWyAgMTY1LjQzNDk0MF0gLS0tWyBlbmQg
dHJhY2UgY2JhYjk1N2U3NTMwOTQ2NCBdLS0t
--0000000000005c70e705f1f68fce--
