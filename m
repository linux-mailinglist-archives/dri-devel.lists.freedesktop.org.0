Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CEEB053CC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB25B10E545;
	Tue, 15 Jul 2025 07:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="FmseD3ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2057 seconds by postgrey-1.36 at gabe;
 Tue, 15 Jul 2025 07:54:40 UTC
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1354410E545;
 Tue, 15 Jul 2025 07:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1752566050;
 bh=lCZvuab/16TaVwQ5rI7WJwbKeMlM/ItuANoajbv3L2Y=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=FmseD3nslxv2WzOPOC+m/8JJnbtV9dpKkZWoxzBSjrVBVk5mN+SV7+0j5XkqX+2+b
 8ybQRaJcQ7hmUAHNRj2r8suwqLBppXBN2EdtKJ3nUE2UAdP14hivwz40UvdLzRsr4c
 zfChanjJufiNdwK7r6BpEInwX5etTf4vnHzXrVTU=
X-QQ-mid: zesmtpip2t1752566003tb4774524
X-QQ-Originating-IP: jjkK/Vf4L74BdD9kpYPdRm9xTrp/Q9zcy1uOS8r9kg4=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 15:53:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8211430334960576053
EX-QQ-RecipientCnt: 62
Message-ID: <5D06C25920559D71+06c9ce34-9867-495c-9842-dcfe9f1d51bb@uniontech.com>
Date: Tue, 15 Jul 2025 15:53:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] treewide: Fix typo "notifer"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, dave@stgolabs.net, jonathan.cameron@huawei.com,
 dave.jiang@intel.com, alison.schofield@intel.com, vishal.l.verma@intel.com,
 ira.weiny@intel.com, dan.j.williams@intel.com, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, airlied@gmail.com,
 simona@ffwll.ch, marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, arend.vanspriel@broadcom.com,
 ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
 jirislaby@kernel.org, jgross@suse.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, akpm@linux-foundation.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, ming.li@zohomail.com,
 linux-cxl@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, kvalo@kernel.org,
 johannes.berg@intel.com, quic_ramess@quicinc.com, ragazenta@gmail.com,
 jeff.johnson@oss.qualcomm.com, mingo@kernel.org, j@jannau.net,
 linux@treblig.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 shenlichuan@vivo.com, yujiaoliang@vivo.com, colin.i.king@gmail.com,
 cvam0000@gmail.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com
References: <B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com>
 <2025071545-endnote-imprison-2b98@gregkh>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <2025071545-endnote-imprison-2b98@gregkh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FHPp0EXrNW93l6uPQg7ZugeB"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N78F51LyEckkcDKzgv7Tnx6Yp49PDg39J1bVDhLfHHd0rhYkT/hwxpFU
 nAzx1qs0s+CZVEarInXWkJSYDyjG5fEaJ+hZx9jLwMOoUgtqLzuy1iTjyPoWfqhj+IYbbRH
 815ZtMCZHlg+O/eRDDF3MIhrmsfS+5B93jrd4/Sdibs9lcQiNjtCFDJOfWoIVueDLmYFS8v
 VB/LY0tSpaUFXN0I8tnRhqDP+4opnYcVeFBdeHH1gsrDV8w3T4ntdRfljPWHvbuHFqq/9lC
 wQMQHkUMK4ASdK4S5rbdYMEEyQWsCBMuKaLkF+xf/fhf2a8QpGzBOOmfBecmeCEckZX7PUi
 8qpEEUY1UWPeYMOIshTB8Q3uZ/s7pYTQWMdYdgGfgPDAMPmPumrF1G5gtXTzGx6vYWEEgQw
 H2ybJCIkaaDCI2iRmOnyv5yQJoeYN1haEIbyNhbJQXge9xtWUDQGGm03IZYDYRlIJc6XUOe
 enimVvTa7gFJYRf8RmeyC6ksAfWy5cU/vortf0B/NYiN2dKgTxoO8xfp5B3yBoMhobOrgrN
 Oo8n1sqDNoVpa6nHCEVE8wZBW2mpJnjPSkiFJk7a+tBV52agPS9YPrpR9SoKaXnzDOoTCuL
 tAi6K1lHMPUrEJqxglrAMTJcwWADjEzuPssJ4uUKvGg2wRbJ7rVl1/JdLUem69NHnGilyon
 fo+oFgB4E8DXNXrE6B2awCWm2KQynyQZtNxzNuXsqDAv/8vGvmn0JEAlVViD3PjYJ4OlB2o
 RCVmhyZERfzTxyfuqZULcW+jC6cYshSyPvuviLbkRBs88NtSFuXZ4lPrgUr5hX2woLaKs0i
 pCJVCRzyY3OK/ucm/lrXrHEW6nF1AQA+gK52kvZLXTu7NHkqO53DRme7iB/Li2Pit+EUMR0
 6yw3dd56ArCWIs3SYAhnL3nYLcNLTbkqMfQy96MKIK92Y6gqmXlc/1hGPN6Cwxw6MbJ+Pch
 J9QpICNEXTP0w7Ph0szyo/pzMrgbMFi7IpICOk9lLoy7EOxgLhCd0RykRZLQcs0BFvOElEG
 mH8kNMDhSm4ZPjMHJPiiopshgr5QoWOS0+HwlhVEPtRDA5I82vtsb2eWJwQNdE6vzy7fQ7G
 ZRA9r0M7rm6s5mF8QzQm5vp6eAy4yhZnvl4pbg6QkpA
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FHPp0EXrNW93l6uPQg7ZugeB
Content-Type: multipart/mixed; boundary="------------Jc6hPek6M3VHoBxxe00gmN7f";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, dave@stgolabs.net, jonathan.cameron@huawei.com,
 dave.jiang@intel.com, alison.schofield@intel.com, vishal.l.verma@intel.com,
 ira.weiny@intel.com, dan.j.williams@intel.com, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, airlied@gmail.com,
 simona@ffwll.ch, marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, arend.vanspriel@broadcom.com,
 ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
 jirislaby@kernel.org, jgross@suse.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, akpm@linux-foundation.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, ming.li@zohomail.com,
 linux-cxl@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, kvalo@kernel.org,
 johannes.berg@intel.com, quic_ramess@quicinc.com, ragazenta@gmail.com,
 jeff.johnson@oss.qualcomm.com, mingo@kernel.org, j@jannau.net,
 linux@treblig.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 shenlichuan@vivo.com, yujiaoliang@vivo.com, colin.i.king@gmail.com,
 cvam0000@gmail.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com
Message-ID: <06c9ce34-9867-495c-9842-dcfe9f1d51bb@uniontech.com>
Subject: Re: [PATCH] treewide: Fix typo "notifer"
References: <B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com>
 <2025071545-endnote-imprison-2b98@gregkh>
In-Reply-To: <2025071545-endnote-imprison-2b98@gregkh>

--------------Jc6hPek6M3VHoBxxe00gmN7f
Content-Type: multipart/mixed; boundary="------------sUIOFoVilt68TT8Wt0dx0iNl"

--------------sUIOFoVilt68TT8Wt0dx0iNl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgZ3JlZyBrLWgsDQoNCk9uIDIwMjUvNy8xNSAxNToyMiwgR3JlZyBLSCB3cm90ZToNCj4g
UGxlYXNlIGJyZWFrIHRoaXMgdXAgaW50byBvbmUtcGF0Y2gtcGVyLXN1YnN5c3RlbSwgbGlr
ZSBpcyByZXF1aXJlZCBmb3INCj4gdGhpbmdzIGxpa2UgdGhpcy4NCj4NCj4gdGhhbmtzLA0K
Pg0KPiBncmVnIGstaA0KPg0KSG9uZXN0bHksIEkndmUgYWx3YXlzIGJlZW4gcXVpdGUgdW5z
dXJlIGhvdyB0byBoYW5kbGUgc2l0dWF0aW9ucyBsaWtlIHRoaXMuDQoNCkl0IHNlZW1zIGV2
ZXJ5IHN1YnN5c3RlbSBtYWludGFpbmVyIGhhcyBkaWZmZXJlbnQgcHJlZmVyZW5jZXMuIEkn
dmUgDQpwcmV2aW91c2x5IGVuY291bnRlcmVkIHNvbWUgbWFpbnRhaW5lcnMgd2hvIHN1Z2dl
c3RlZCBJIHNwbGl0IHN1Y2ggDQpwYXRjaGVzIGJ5IHN1YnN5c3RlbSBzbyBlYWNoIG1haW50
YWluZXIgY291bGQgbWVyZ2UgdGhlbSBpbnRvIHRoZWlyIHRyZWUgDQp3aXRob3V0IGNvbnRl
bnRpb24uIEhvd2V2ZXIsIG90aGVyIG9uZXMgaGF2ZSBhcmd1ZWQgdGhhdCBmaXhpbmcgc3Bl
bGxpbmcgDQplcnJvcnMgaXNuJ3Qgd29ydGggbXVsdGlwbGUgY29tbWl0cywgY2xhaW1pbmcg
aXQgd291bGQgY3JlYXRlIGNoYW9zLg0KDQpTaW5jZSBJIGdlbnVpbmVseSBkaXNjb3ZlciB0
aGVzZSBzcGVsbGluZyBlcnJvcnMgYnkgY2hhbmNlIGVhY2ggdGltZSwgDQphbmQgdG8gYXZv
aWQgZ2l2aW5nIHRoZSBpbXByZXNzaW9uIEknbSAic3BhbW1pbmciIHRoZSBrZXJuZWwgdHJl
ZSBmb3IgDQpzb21lIHVsdGVyaW9yIG1vdGl2ZSwgSSd2ZSBvcHRlZCB0byBzcXVhc2ggdGhl
bSBpbnRvIGEgc2luZ2xlIGNvbW1pdC4NCg0KVGhhdCBzYWlkLCBJIHBlcnNvbmFsbHkgZG9u
J3QgaGF2ZSBhbnkgc3Ryb25nIGZlZWxpbmdzIG9yIHByZWZlcmVuY2VzIG9uIA0KdGhpcyBt
YXR0ZXIuIFNpbmNlIHlvdSd2ZSByZXF1ZXN0ZWQgaXQsIEknbGwgZ28gYWhlYWQgYW5kIHNw
bGl0IGl0IHVwIA0KYW5kIHNlbmQgYSB2MiBwYXRjaHNldC4NCg0KVGhhbmtzLA0KDQotLSAN
CldhbmdZdWxpDQo=
--------------sUIOFoVilt68TT8Wt0dx0iNl
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------sUIOFoVilt68TT8Wt0dx0iNl--

--------------Jc6hPek6M3VHoBxxe00gmN7f--

--------------FHPp0EXrNW93l6uPQg7ZugeB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaHYI7gUDAAAAAAAKCRDF2h8wRvQL7oEn
AP9MLViBb0RqjK9xx+PcIi0hiZmUC/37qYH8rnmPBkSAXQEAtm2V/wO2Wv0JvbeWgMrpl99ZvtNN
kg8rYtwbJwIkrA4=
=lTpo
-----END PGP SIGNATURE-----

--------------FHPp0EXrNW93l6uPQg7ZugeB--
