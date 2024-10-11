Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DC299ACE3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 21:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301FD10E07B;
	Fri, 11 Oct 2024 19:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="joLeekbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic314-20.consmr.mail.ir2.yahoo.com
 (sonic314-20.consmr.mail.ir2.yahoo.com [77.238.177.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D20910E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 19:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1728675730; bh=QdxfIqBJgxkSu9IxavGoJTl6cPZPsvz83rW/wuE0ntA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=joLeekbUBw+JEM/GPn2DwvG2BouFH+lBUi85EIfPm84LYW1aPC0SnLc3BmMOqpPGxHxJpSVI/VPHYWcalas3x/wXhzbZXhua2wHwwyNljQJs8GVBEjzyPLAhCz5eLiOotezFoo4VjnGQZH61aGwZt7wYF0JaYHGD0PJU8OoAljmKsCKz5OQnkhnuDkYPm1XkWwCkSvJnHSKAg743XdbhaicrsIWi2fJTIL+1734kUSkzgNrAiALTJa9Eiff+eigqn9Y+fHViyqY5stFH781IKHLEifIxqQSwWjFeL78YV4BpgUkUByLK+RPlGLCP36QSR//0H3gY4OXgfYohT41j8Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1728675730; bh=PDEqepCN+aqz2KbFNIyZrkMWN7nMbrJjyqfRqC71czB=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=pNRjErnD3tbL1YP04eq9i42ho6f5FrI0yQKA9wXuhbxaT8DMkO6lY2fz/NQ1goMPTTp+8N0K+HdHzTkLjp2XyGVJoRFHGlCbwM4wxJ4sJ6Tvv2aWTJe+3Zfi4iVMmxuUs2/sFTAfgBnl8ZiOF39y469zAOcV0bYQxMd1SIHUCf+hD9d9J0XZEIO6htR+eY8peb6YlIQltxfhlRbpUqz2Gw8YU4luanVzr4S6H/tpJvH/KsSryvKi76qakiKCwSWH05QraqYU8824suWyTGZ8EIURt3cL01taOFrSOWoHK5b/wHvYJA56n+hVIPYTKsal5mh1bwGHJl7ZAfGPfWMKpQ==
X-YMail-OSG: MBTzprIVM1mA65Cu246_MUdx.IwNDtKyXB332rt_XiQ5wNuwIayUiKJphiKSW_w
 rwyGbqI2rysa6rare3.gy0Ig8zIh3gp2TUNLR_LnoLmwbUJ4UXiJZCYlHs0laG_K.E4WR6J.WTYs
 1CcQgWkQ8.Mo8aFsxSd9fAgDBwtB3RVb9v_FZv2kF3EljDY9AQ8ia_zj6d6b4qfPpJAJoZQrSQfX
 sdJUrA01dcuqZlK7W_40mL6ciFhj0nvBXU8Q08LfIpLjmVFDe3.4ibxgl92hlqzWiK6PV1rJSi9B
 ypv8A1VmRPKhuPg5ktHpeg_wjcM81PFXvTkdwcfrn89QmJ9T29MKAUX96UIg7jdVfEjIggOHxht2
 Le8DC83h.l5llnls13aCRrEpEutmaVqcmJJwzM1B4CRIIVh2ZB.7VCe15lzaFW4YNCx4986RYRL5
 hVswA8YdXY8rbxPpQyIGmr6XB8qPogCrnA9rrJ9SQ5ngnDPDGOG6EyuThHgq26TxuVrrVt4uQdFd
 HtDaQX312zxPofCunYOz2CaJ2FtX9vAjxFXQSI9X2jIxYBkGtFQnoG8oLsM3a3ztPlO7PYM2dQeX
 USJzOIO6cSv6IW2VJnLSHUzyyndhzAWGRyLdef0TiONN75J.TIH4TXY.fHMrg_61.WrRK91p8rKr
 LUt9gcIRga7yc2Mh0biudRsL.e.zgJIHqlPA8xQmfaPBpQIwPofhx7EaV8XZ.JmmweqWF9CmGrgF
 yXPBwDa9.Ui3LPlkqeR8SljfkkMfoC0gCit.iY0ZPw84L5Jt5OqqWHNttJWEPritSByD3s1Y7QO2
 pV2kT9OBU9ZOP4p8bv6zdU0VzQQVcXwmxKUAlg06VrEsjlHuau245aN6sY.6q07TY4h2jajb44MZ
 U94g4JZoMLJ4MkxyQShT.uwL4_AG_p2G9iPpMgB0Cnf0JzC1RiIPq9cDIqY45ryB78eJgYrrxdHu
 91SlsP_4lX7hN.XhKmVxow_OlYgpFZhYFsg63mboSdWNWZGAv1XbIDENzBan1ChmDQqHY8cw6oMF
 kO1.kXpj0e5xrXLLm.qRty.AeIA4oCCQr9PkCn583xCnpYEQAjvFjd3gQdu0onYH3Mwt5NQTOvVi
 1U1j4Le4W1YvC10jMCqD55HKGj5i_2Ack98ofMjBmNnUTrnahO8V062.g8rrKkiby7my5bsFCLon
 Kzos9ytK_KHWz9wBxnz_c0Ka1Dfm5dhPtJKmixMJw_UhTqv7QHV4kR30y52zByDBBYXnZrG849Cn
 UFx7BkrsI4aGbdIJnt_8NHdWNyaflBlt4SGqL3d_WH8cfewBQmcqZM3oa3SKFqU6l.fRSHZoY_Im
 0lhcagRyyDxMnAKBF33AVjyvsOpebeaCwVHwWPqpBWLLZPrseOryjawWw5C1OjZ0EGDNI2ji9pSb
 o6iHbNMEVMmdlQ0IqYMedgF4ZW7x6Xd6jgocUaX6hCwCECxZoOIh7OvMPiEXsNe0JtrUU4OsmYfl
 Ck5P3Chq66j68N6X6KgQ7vtPwDuyxYDsnk1rYk.V5sSmsKGpQxg3vwcgDTCwXP4pF1fXmaGhzvuv
 ix_n9u7GI.ypzYHYHdAh8X4QGChrMfBiR6BUrY3TYhE21M8AFmGSrkBvSnj_kxR41u2hs.l_iwb9
 FarTGt64uwFgXQNwrDV.46lMTFGe55y2Xjw35NZ6EF8wuSfkLS3T1mjLofRCnjeh4XYlbuOOi8Aa
 uNknwkf_mDXPr5uk2LXDSL6et4ZWFIR6iH.mDo5J1TL7fWnOk8IgNgqApIaAZ1FLK4AiiGe3p6mG
 N7s_F.ZhZ1DDzNlU9URmN8ZZfYsNj4Z9J81sF2OQsyaljaoe9eGSUJHeyfnYBsUlPCAhYdGJT7kS
 J5oJpA0BgKiOn2YvSCPjhtaTK9oWQXWFz3vrmB.tTFwmnc.r4xHD1jjmYcOaqId6JgRxunIAnfZx
 h5NlVQ7HtHFONFiEehmh_kiNfFM579McxwyuGbg51jkD3908YjzHJmNCnpNLbB4EUEp33miyZlNp
 c8rPFPsSIjDGdu8dpVmCebyCPanawdk_SrImZ3tJtoMxiLwts1vJ7okrY05hpIv_sr8mKEQw7Y8E
 2tW7eHzzlBnd.Vapy6Wyc28mJIykXZdmJfVrx6n2Z4ZZ3NqTLHRZHfywLjgNI3ZVtEteVuOw0w0d
 AEbSw8Xv.3ZFLgimCuWyJNF2oxkvlrCKk_boBSoDXyo_MwZH7StW8xedJwm6YKOdqc1lXKSWoa42
 SxILLddwGRWedn0.j94t_KJJ72.ZkKH5KW.iaUrvA7LsQpvgH1hChrtZF73Lnts6AQN7baaLAw2D
 uS5arguiY9YRzrALHXeCeemlFomrj4UGgWQZxFZTw4l6A
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 33d90e31-71f6-47e4-93fd-d85ec77e0a35
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ir2.yahoo.com with HTTP; Fri, 11 Oct 2024 19:42:10 +0000
Received: by hermes--production-ir2-6664f499fc-ggmrm (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5c9e3e37c360bbb7e8327b384596edb5; 
 Fri, 11 Oct 2024 19:42:08 +0000 (UTC)
Message-ID: <eaf1994a-a85d-4dcd-b729-2dba8354e8cc@rocketmail.com>
Date: Fri, 11 Oct 2024 21:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/panel: samsung-s6e88a0-ams427ap24: Add initial
 driver
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1728582727.git.jahau@rocketmail.com>
 <d36d0d152c509b78d02f9f7adbea665c0c863446.1728582727.git.jahau@rocketmail.com>
 <6d67c2c6-819b-481a-8cc9-e24ef8f6c142@quicinc.com>
Content-Language: de-DE, en-US
From: Jakob Hauser <jahau@rocketmail.com>
In-Reply-To: <6d67c2c6-819b-481a-8cc9-e24ef8f6c142@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Mailer: WebService/1.1.22806
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

SGkgSmVzc2ljYSwNCg0KT24gMTEuMTAuMjQgMTg6NTIsIEplc3NpY2EgWmhhbmcgd3JvdGU6
DQo+IA0KPiANCj4gT24gMTAvMTAvMjAyNCAxMTozMSBBTSwgSmFrb2IgSGF1c2VyIHdyb3Rl
Og0KDQouLi4NCg0KPj4gK3N0cnVjdCBzNmU4OGEwX2FtczQyN2FwMjQgew0KPj4gK8KgwqDC
oCBzdHJ1Y3QgZHJtX3BhbmVsIHBhbmVsOw0KPj4gK8KgwqDCoCBzdHJ1Y3QgbWlwaV9kc2lf
ZGV2aWNlICpkc2k7DQo+PiArwqDCoMKgIHN0cnVjdCByZWd1bGF0b3JfYnVsa19kYXRhICpz
dXBwbGllczsNCj4+ICvCoMKgwqAgc3RydWN0IGdwaW9fZGVzYyAqcmVzZXRfZ3BpbzsNCj4+
ICvCoMKgwqAgYm9vbCBwcmVwYXJlZDsNCj4gDQo+IEhpIEpha29iLA0KPiANCj4gSSB0aGlu
ayB5b3UgY2FuIGRyb3AgdGhlIGBwcmVwYXJlZGAgaGVyZSBhcyBpdCBzaG91bGQgYmUgaGFu
ZGxlZCBieSANCj4gZnJhbWV3b3JrIG5vdyBbMV0NCj4gDQo+IFRoYW5rcywNCj4gDQo+IEpl
c3NpY2EgWmhhbmcNCj4gDQo+IFsxXSANCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuMTEuMy9zb3VyY2UvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgjTDI2Mg0KPiAN
Cj4+ICt9Ow0KDQpUaGFua3MgZm9yIHRoZSBoaW50LiBJJ2xsIGNoYW5nZSB0aGF0IGluIHYy
Lg0KDQouLi4NCg0KS2luZCByZWdhcmRzLA0KSmFrb2INCg==
