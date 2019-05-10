Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE6219745
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 05:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FCB898F5;
	Fri, 10 May 2019 03:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic314-48.consmr.mail.sg3.yahoo.com
 (sonic314-48.consmr.mail.sg3.yahoo.com [106.10.240.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F4E898F5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 03:55:02 +0000 (UTC)
X-YMail-OSG: 7B.hAgAVM1niHH2YX6kcSPhX1uk0eY0pdYVW07vmmIopkiBJyTcL1rd2k5sktjJ
 .g9EL6.CxeK3YcdNniafIvkfmA6h4XpKhYUNfkvr0aR3bV_.zKA_sibCmvUjBBXtclo7eZw9Zv.l
 ITB_j8KS_zG6_hdqXzfWbxf1aV4RfyQsyIRFn3DZL5EKPsC9KdnpTMJI9EGeyUeouLGGJ1Vpp.I9
 4RPfXZcRNWR2sx6D1MhDmTag.ZGukM66MW1E_pQbMXPOO2XD3Rfq3dggmIINU9oW3khLj7XtuT1n
 v5MSJi4_ECbesL8xj.E28Rhq4Y2iT1Ik6JXAn3smr.Iikqupkc6HcRFSZ6Tq0hP0vyn3.PNNlpeY
 wOjhQ24f7awSrGMuw8KfBp_ob_e3hFKZ18OThowfeplLaNm5TU9TCpgqb8Nt_mbjAI_IlQZvD0O1
 .7m3qSAmZkthggbXZm3rbxCmb72KocfPBxR0MxvKHNr8hlSfHguzmq8qBDw6YACRCGAgEjjJyQdA
 eJrZcaiXEOx.iWfd7ySUhQwWjhNQoQ.nyGT6m7OfPU3tK1ZUUkFEfgPzy5TMH85J54a5WZhP1._0
 kGc5OlKqzaMmu35cvosYzS1dWMMXKM1uxqH3OPq6LZwn78m3O.KRF0maj7xuS2EIJp2fMIJgAFDq
 5gbagaDCd5ZtAE1lLkcfDLp.bgG8vlKpK.99JJ80j3KEEK02sbGGZtnwlLcXlCXtsWSDXfDYt7CS
 CkyvgO9nhpYBLOGZ7.7qnlkMsdTd9UTDpl3niTAFlq5.WIQHtkaE5YdzdH0TeOdHZ.vs.1GCEYxm
 GRrzUIPAGCk16nUhMFka_O_2VELj_dDIVWiFSjQRNFl3jxVxcbblh4WOXTQu2OY08m0VjHAGmVv8
 RGQyiMJ8cNt79OQZGUxpLC7gBclnLOu5g4t.nk5MkPIA9yqMU4lkx3l3YIRm6XCJBxOXgI9jJTQV
 6YMXwxgcn18lgsv_UvRsVSPuSRuIk5Jj9UlKkzzvqaEgxv03DXlFsdNmX0Mt9d3nyg5BhCu8.so7
 qrVGPfMJdA4GW32z6aYM87XZ6V1J7DKWfgotyNHMFK9qp60vCK5ORqFTXlULyRaX_SDidRRRZVOw
 c_rtSGQ1UcvpPhYSew6rQTF4JfFmemSFH4HpuFpT4AJYDKDOd0q.5HJIYK2CIrP0i6WQ0jj9adCt
 ysyBiVEecEC7JXnXcGT5WbmLilPzL4ofuudes0L9o_poeKbAgndjvYA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.sg3.yahoo.com with HTTP; Fri, 10 May 2019 03:55:00 +0000
Received: from 211.144.196.226 (EHLO [192.168.2.114]) ([211.144.196.226])
 by smtp425.mail.sg3.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 41b167ce65fbe0a0571fafad39d6f004
 for <dri-devel@lists.freedesktop.org>;
 Fri, 10 May 2019 03:52:59 +0000 (UTC)
Subject: [Bug] program become uninterrupt(STAT D) when run 64 graphics program
 in sub window
References: <22df3c31-00af-6b43-9845-07025318d6e5@yahoo.com>
From: wormwang <wormwang@yahoo.com>
To: dri-devel@lists.freedesktop.org
X-Forwarded-Message-Id: <22df3c31-00af-6b43-9845-07025318d6e5@yahoo.com>
Message-ID: <cd23d7f1-f4ee-2a68-cf6d-00b8e4fa9708@yahoo.com>
Date: Fri, 10 May 2019 11:52:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <22df3c31-00af-6b43-9845-07025318d6e5@yahoo.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1557460500;
 bh=eLlPS9XBbKSvnwBkL2eASi5h4W5B+6CVSIAPV5nJK50=;
 h=Subject:References:From:To:Date:In-Reply-To:From:Subject;
 b=BRPhXbrCFbCOQqf0ac1dSgNZ5/qT8+XAsYU3WGHoKbysg6ThEemyW/eRvyej80fVw+Q5FQLDFmOFO3RUX8zp1CxjMbukGKoAGyoUOzbV3Y++s8VOv4xN0ZfKLsVbjENRt1qbZ7MuFrViicOauNrIJyR1ZjLixbLBu8qhdmyQCMM+ijMIx+pOGERPWnhY/J0N2zSjf54r9N+bgdQZ1EzeQ4Dsc/gxmalBjfBlKTyWPxVJAVrBqw8V1KfYJYVXd+5KIeDxX37YUalysNEVtiF/3ogSnREaCdC/91LYZvKeoBXjLBlhczFzvKOoV26+WxaCAGTjtyeYmkhw8z3YGWp7Vg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkxpbnV4IGtlcm5lbCA1LjAgLCBhbWQgcng1ODAgZ3B1IGNhcmQKCgoxIG9yIG1hbnkgZ3JhcGhp
Y3MgcHJvZ3JhbSBiZWNvbWUgdW5pbnRlcnJ1cHRlZChTVEFUIEQpIHdoZW4gcnVuIDY0IApncmFw
aGljcyBwcm9ncmFtIG9mIHN1Yi13aW5kb3cgY29uY3VycmVudGx5LgoKV2UgaGF2ZSB0byByZWJv
b3QgbWFjaGluZSB0byByZWxlYXNlIHRoZSB1bmludGVycnVwdGVkKFNUQVQgRCkgcHJvZ3JhbS4K
CldlIGhhdmUgc3VjaCBrZXJuZWwgbG9nOgoKCiDCoGtlcm5lbDogUmVuZGVyVGhyZWFkIEQgMCAz
OTM3ODYgMzM3MjQyIDB4MDA0MDAwMDgKIMKga2VybmVsOiBDYWxsIHRyYWNlOgogwqBrZXJuZWw6
IF9fc3dpdGNoX3RvKzB4YmMvMHgxYzAKIMKga2VybmVsOiBfX3NjaGVkdWxlKzB4M2ZjLzB4Y2Ew
CiDCoGtlcm5lbDogMHhmZmZmODAxZmQzMmEwMDAwCiDCoGtlcm5lbDogVFAtSW9Cb3VuZC0yIEQg
MCA0MDAyMDAgMzM3MjQyIDB4MDA0MDAwMmQKIMKga2VybmVsOiBDYWxsIHRyYWNlOgogwqBrZXJu
ZWw6IF9fc3dpdGNoX3RvKzB4YmMvMHgxYzAKIMKga2VybmVsOiBfX3NjaGVkdWxlKzB4M2ZjLzB4
Y2EwCiDCoGtlcm5lbDogc2NoZWR1bGUrMHg0MC8weDk4CiDCoGtlcm5lbDogc2NoZWR1bGVfcHJl
ZW1wdF9kaXNhYmxlZCsweDI4LzB4NDAKIMKga2VybmVsOiBfX211dGV4X2xvY2srMHgyNjQvMHg4
NTAKIMKga2VybmVsOiBtdXRleF9sb2NrX25lc3RlZCsweDNjLzB4NTAKIMKga2VybmVsOiBkcm1f
cmVsZWFzZSsweDNjLzB4ZDggW2RybV0KIMKga2VybmVsOiBfX2ZwdXQrMHhjMC8weDIzMAogwqBr
ZXJuZWw6IF9fX19mcHV0KzB4MjAvMHgzMAogwqBrZXJuZWw6IHRhc2tfd29ya19ydW4rMHhhMC8w
eGQwCiDCoGtlcm5lbDogZG9fZXhpdCsweDM2NC8weGI1MAogwqBrZXJuZWw6IGRvX2dyb3VwX2V4
aXQrMHg0MC8weGE4CiDCoGtlcm5lbDogZ2V0X3NpZ25hbCsweGYwLzB4OTcwCiDCoGtlcm5lbDog
ZG9fbm90aWZ5X3Jlc3VtZSsweDJhYy8weDM5MAogwqBrZXJuZWw6IHdvcmtfcGVuZGluZysweDgv
MHgxNAogwqBrZXJuZWw6IEJvb3RBbmltYXRpb24gRCAwIDQwMDkwNSAzOTM3MzcgMHgwMDAwMDAw
MAogwqBrZXJuZWw6IENhbGwgdHJhY2U6CiDCoGtlcm5lbDogX19zd2l0Y2hfdG8rMHhiYy8weDFj
MAogwqBrZXJuZWw6IF9fc2NoZWR1bGUrMHgzZmMvMHhjYTAKIMKga2VybmVsOiBzY2hlZHVsZSsw
eDQwLzB4OTgKIMKga2VybmVsOiBzY2hlZHVsZV9wcmVlbXB0X2Rpc2FibGVkKzB4MjgvMHg0MAog
wqBrZXJuZWw6IF9fbXV0ZXhfbG9jaysweDI2NC8weDg1MAogwqBrZXJuZWw6IG11dGV4X2xvY2tf
bmVzdGVkKzB4M2MvMHg1MAogwqBrZXJuZWw6IGRybV9zdHViX29wZW4rMHg0NC8weDExOCBbZHJt
XQogwqBrZXJuZWw6IGNocmRldl9vcGVuKzB4YWMvMHgxYzAKIMKga2VybmVsOiBkb19kZW50cnlf
b3BlbisweDFjNC8weDM3MAogwqBrZXJuZWw6IHZmc19vcGVuKzB4MzgvMHg0OAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
