Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87068933B8
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 18:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C461410ED6B;
	Sun, 31 Mar 2024 16:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZBD0ycWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 509 seconds by postgrey-1.36 at gabe;
 Sun, 31 Mar 2024 16:46:37 UTC
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178F010ED66;
 Sun, 31 Mar 2024 16:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id DC6F420754;
 Sun, 31 Mar 2024 18:38:06 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tw5d1n4iRPt8; Sun, 31 Mar 2024 18:38:05 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 537392083F;
 Sun, 31 Mar 2024 18:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 537392083F
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
 by mailout1.secunet.com (Postfix) with ESMTP id 45AF980004A;
 Sun, 31 Mar 2024 18:38:04 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:38:04 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:36:29 +0000
X-sender: <wayland-devel-bounces@lists.freedesktop.org>
X-Receiver: <martin.weber@secunet.com> ORCPT=rfc822;martin.weber@secunet.com
 NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAJuYHy0vkvxLoOu7fW2WcxcPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAF4AAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249V2ViZXIgTWFydGluOTU1BQALABcAvgAAALMpUnVJ4+pPsL47FHo+lvtDTj1EQjIsQ049RGF0YWJhc2VzLENOPUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpLENOPUFkbWluaXN0cmF0aXZlIEdyb3VwcyxDTj1zZWN1bmV0LENOPU1pY3Jvc29mdCBFeGNoYW5nZSxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXNlY3VuZXQsREM9ZGUFAA4AEQBACf3SYEkDT461FZzDv+B7BQAdAA8ADAAAAG1ieC1lc3Nlbi0wMQUAPAACAAAPADYAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0Lk1haWxSZWNpcGllbnQuRGlzcGxheU5hbWUPAA0AAABXZWJlciwgTWFydGluBQAMAAIAAAUAbAACAAAFAFgAFwBGAAAAm5gfLS+S/Eug67t9bZZzF0NOPVdlYmVyIE1hcnRpbixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc2UNCg8AL
 wAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: a.mx.secunet.com
X-ExtendedProps: BQBjAAoAz3QFfe5Q3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAGAAAAG1hcnRpbi53ZWJlckBzZWN1bmV0LmNvbQUABgACAAEFACkAAgABDwAJAAAAQ0lBdWRpdGVkAgABBQACAAcAAQAAAAUAAwAHAAAAAAAFAAUAAgABBQBiAAoAZgAAAO+KAAAFAGQADwADAAAASHVi
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.36
X-EndOfInjectedXHeaders: 13306
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=131.252.210.177; helo=gabe.freedesktop.org;
 envelope-from=wayland-devel-bounces@lists.freedesktop.org;
 receiver=martin.weber@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 20A4720820
X-Original-To: wayland-devel@lists.freedesktop.org
Delivered-To: wayland-devel@lists.freedesktop.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lPWMOzZ1sCBLtkhfMiJDfHToxmpKev7gqm0R7FskFf0=; b=ZBD0ycWJxDl4Z9KMqRhF77mf/G
 +DGVX4I1duoRiIJ47Xv7S1iRDqsS+34zyUta/XwRBgJNkt/oSGEyrY6gv3lIL1PIUzmRZglkko0IS
 NMSbfzT2NgjsaOyQ8lEwVQhDYaTzFz3XGyvGR47oIUgJtx48XCojs4oJLLCnGg2KY354Io0tPUG+h
 hCoKonEn54rf+EQlt0QPj9uZRkN1vAdTUlYnMyWF5V+ov101iNfxuB/xDWGPQMpJ6AfIIU+k6sS7h
 Yy5u3fM+EfrYsgZL6d7K+LL/w28dZfkg/RfoOHVPYMaNheprjSj9Au+mzNOe6hz3VdjFhGKnYLYfb
 uuShrWeg==;
Message-ID: <0a816356c382e4377953bba256e1275c779b220d.camel@igalia.com>
Subject: Re: 2024 X.Org Foundation Membership deadline for voting in the
 election
From: Ricardo Garcia <rgarcia@igalia.com>
To: events@lists.x.org, xorg-devel@lists.x.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org, 
 xorg@lists.freedesktop.org
Date: Sun, 31 Mar 2024 10:22:20 +0200
In-Reply-To: <57dd238b-2b94-4b46-a8be-c53b2f985e46@igalia.com>
References: <0efcdfe3-ea9e-43e5-ab07-6d69dca2c04a@igalia.com>
 <57dd238b-2b94-4b46-a8be-c53b2f985e46@igalia.com>
Autocrypt: addr=rgarcia@igalia.com; prefer-encrypt=mutual;
 keydata=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
 p0ZW9AkVq7C3F0YSY0Tq5bKR94O8=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-BeenThere: wayland-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-BeenThere: dri-devel@lists.freedesktop.org
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

This is a reminder that the membership renewal period ends in 2 days,
and elections will start after that. Please register as an X.Org
Foundation member to be able to vote in the upcoming elections. Thanks!

-Ricardo Garcia, on behalf of the X.Org elections committee.
=20
On Tue, 2024-03-26 at 11:42 -0400, Christopher Michael wrote:
> The 2024 X.Org Foundation membership renewal period has been extended=20
> one additional week and elections will start the following week on 01=20
> April 2024.
>=20
> Please note that only current members can vote in the upcoming election,=
=20
> and that the deadline for new memberships or renewals to vote in the=20
> upcoming election is 01 April 2024 at 23:59 UTC.
>=20
> If you are interested in joining the X.Org Foundation or in renewing=20
> your membership, please visit the membership system site at:=20
> https://members.x.org/
>=20
> Christopher Michael, on behalf of the X.Org elections committee
>=20
>=20
>=20

X-sender: <intel-gfx-bounces@lists.freedesktop.org>
X-Receiver: <martin.weber@secunet.com> ORCPT=3Dc822;martin.weber@secunet.co=
m NOTIFY=3DVER; X-ExtendedProps=3DAVABYAAgAAAAUAFAARAJuYHy0vkvxLoOu7fW2Wcxc=
PADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdX=
JjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPA=
F4AAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9I=
RjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249V2ViZXIgTWFydGluOTU1BQALABcAvgAAALMpUnV=
J4+pPsL47FHo+lvtDTj1EQjIsQ049RGF0YWJhc2VzLENOPUV4Y2hhbmdlIEFkbWluaXN0cmF0aX=
ZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpLENOPUFkbWluaXN0cmF0aXZlIEdyb3VwcyxDTj1zZ=
WN1bmV0LENOPU1pY3Jvc29mdCBFeGNoYW5nZSxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9u=
LERDPXNlY3VuZXQsREM9ZGUFAA4AEQBACf3SYEkDT461FZzDv+B7BQAdAA8ADAAAAG1ieC1lc3N=
lbi0wMQUAPAACAAAPADYAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0Lk1haWxSZWNpcG=
llbnQuRGlzcGxheU5hbWUPAA0AAABXZWJlciwgTWFydGluBQAMAAIAAAUAbAACAAAFAFgAFwBGA=
AAAm5gfLS+S/Eug67t9bZZzF0NOPVdlYmVyIE1hcnRpbixPVT1Vc2VycyxPVT1NaWdyYXRpb24s=
REM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDA=
NClRyYW5zbWl0SGlzdG9yeTogRmFsc2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3=
BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAA=
Q=3D=0A=
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoAoXQFfe5Q3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc2=
9mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAA=
AAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAGAAAAG1hcnRpbi53ZWJlckBzZWN1bmV0=
LmNvbQUABgACAAEFACkAAgABDwAJAAAAQ0lBdWRpdGVkAgABBQACAAcAAQAAAAUAAwAHAAAAAAA=
FAAUAAgABBQBiAAoAaAAAAO+KAAAFAGQADwADAAAASHVi
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 13458
Received: from cas-essen-02.secunet.de (10.53.40.202) by
 mbx-essen-02.secunet.de (10.53.40.198) with Microsoft SMTP Server
 (version=3DS1_2, cipher=3DS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Sun, 31 Mar 2024 10:22:50 +0200
Received: from b.mx.secunet.com (62.96.220.37) by cas-essen-02.secunet.de
 (10.53.40.202) with Microsoft SMTP Server (version=3DS1_2,
 cipher=3DS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Sun, 31 Mar 2024 10:22:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by b.mx.secunet.com (Postfix) with ESMTP id 8C24220199
	for <martin.weber@secunet.com>; Sun, 31 Mar 2024 10:22:50 +0200 (CEST)
X-Virus-Scanned: by secunet
X-Spam-Flag: NO
X-Spam-Score: -2.449
X-Spam-Level:
X-Spam-Status: No, score=3D.449 tagged_above=3D99 required=3D1
	tests=3DAYES_00=3D.9, DKIM_INVALID=3D1, DKIM_SIGNED=3D1,
	HEADER_FROM_DIFFERENT_DOMAINS=3D249, MAILING_LIST_MULTI=3D,
	RCVD_IN_MSPIKE_H3=3D001, RCVD_IN_MSPIKE_WL=3D001, SPF_HELO_NONE=3D001,
	SPF_PASS=3D.001] autolearn=3Dm autolearn_force=3D
Authentication-Results: a.mx.secunet.com (amavisd-new);
	dkim=FAil (2048-bit key) reason=3Dail (message has been altered)"
	header.d=3Dalia.com
Received: from b.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGwCM6RFkEEq for <martin.weber@secunet.com>;
	Sun, 31 Mar 2024 10:22:47 +0200 (CEST)
Received-SPF: Pass (sender SPF authorized) identity=3Dilfrom; client-ip=131=
.252.210.177; helo=3Dbe.freedesktop.org; envelope-from=3Dtel-gfx-bounces@li=
sts.freedesktop.org; receiver=3Drtin.weber@secunet.com=20
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com A7AA020322
Authentication-Results: b.mx.secunet.com;
	dkim=FAil reason=3Dignature verification failed" (2048-bit key) header.d=
=3Dalia.com header.i=3Dgalia.com header.b=3DBD0ycWJ"
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177]=
)
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by b.mx.secunet.com (Postfix) with ESMTPS id A7AA020322
	for <martin.weber@secunet.com>; Sun, 31 Mar 2024 10:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB7B10E97B;
	Sun, 31 Mar 2024 08:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=FAil reason=3Dignature verification failed" (2048-bit key; unprotecte=
d) header.d=3Dalia.com header.i=3Dgalia.com header.b=3DBD0ycWJ";
	dkim-atps=3Dutral
X-Original-To: intel-gfx@lists.freedesktop.org
Delivered-To: intel-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EA610E8FB;
 Sun, 31 Mar 2024 08:22:25 +0000 (UTC)
DKIM-Signature: v=3D a=3Da-sha256; q=3Ds/txt; c=3Dlaxed/relaxed; d=3Dalia.c=
om;=20
 s 170329;
 h=3DME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent=
-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3DWMOzZ1sCBLtkhfMiJDfHToxmpKev7gqm0R7FskFf0=3D=3DD0ycWJxDl4Z9KMqRhF77mf=
/G
 +DGVX4I1duoRiIJ47Xv7S1iRDqsS+34zyUta/XwRBgJNkt/oSGEyrY6gv3lIL1PIUzmRZglkko=
0IS
 NMSbfzT2NgjsaOyQ8lEwVQhDYaTzFz3XGyvGR47oIUgJtx48XCojs4oJLLCnGg2KY354Io0tPU=
G+h
 hCoKonEn54rf+EQlt0QPj9uZRkN1vAdTUlYnMyWF5V+ov101iNfxuB/xDWGPQMpJ6AfIIU+k6s=
S7h
 Yy5u3fM+EfrYsgZL6d7K+LL/w28dZfkg/RfoOHVPYMaNheprjSj9Au+mzNOe6hz3VdjFhGKnYL=
Yfb
 uuShrWeg=3D
Received: from 30.red-83-52-1.dynamicip.rima-tde.net ([83.52.1.30]
 helo=3Dcalhost.localdomain) by fanzine2.igalia.com with esmtpsa=20
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rqqSL-00HFxV-9H; Sun, 31 Mar 2024 10:22:21 +0200
Message-ID: <0a816356c382e4377953bba256e1275c779b220d.camel@igalia.com>
Subject: Re: 2024 X.Org Foundation Membership deadline for voting in the
 election
From: Ricardo Garcia <rgarcia@igalia.com>
To: events@lists.x.org, xorg-devel@lists.x.org,=20
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,=20
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,=20
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,=20
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,=20
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org,=20
 xorg@lists.freedesktop.org
Date: Sun, 31 Mar 2024 10:22:20 +0200
In-Reply-To: <57dd238b-2b94-4b46-a8be-c53b2f985e46@igalia.com>
References: <0efcdfe3-ea9e-43e5-ab07-6d69dca2c04a@igalia.com>
 <57dd238b-2b94-4b46-a8be-c53b2f985e46@igalia.com>
Autocrypt: addr=3Darcia@igalia.com; prefer-encrypt=3Dtual;
 keydata=3DINBGJhDyMBEACeWT1BIJfZAtNH2wklpKt6M+XmbddnVqT+0tsPlvqlSAAvP47kJE=
1o4Qirosttq2C+4jH/NZleiA+ydlJV2X9wWN3Wl06Ro1yyI+RqlPP9lcciPGjpd2H6amFGxR4Tn=
d/t/fpu2euO8rn33n8qyLTqrJEhAFoAmZUUVzthCmIwCIf2DWTjuKUW9sCMrE5p4ybRobdT0/oT=
HobPfXvAhjawZeCnJ0Gs776kY6eiOLvTm2oZ0I0szG09aehtEZ5RuDgrCGkDrDGojaFnpT6h9gP=
tk6afa9f2Aaea3P1V3J4nRSId3NMv/Z3SIl91AeOyzUHqtix7Qs7K0pjbLlhQscwlPdkVTi17gO=
Ul+8cVvI88yfIrbkOiGa40mPiSFyffIAZNyn25bZSk8P+6LdfUroeyOvJFTCkOHUElOO6HHcauB=
E6zLkroq17hbC2HCvgE9aP1BLN9UY2m6pqlkt+Psekz8QGwJUM+6hP39t6w5ADp41RAY/W2G0Sl=
6LGpDq7BjrMttFCpzPvovO+eGk6ZkmLnkzJ4Tl6UNRVqQVuJesJzabPkRwR3R18ZzRraLkZDtQF=
blRZG1dSXJuzvgYfC4qiRGEwTaeF/Zcwuc6BbDOUNfzI6x/1JLl4nYDVBdQZzCFdamKdfmZoQ5o=
bidgwjMmb+dSc0tZDQ43jpu0S+W0J9nwARAQABtCNSaWNhcmRvIEdhcmNpYSA8cmdhcmNpYUBpZ=
2FsaWEuY29tPokCUQQTAQgAPBYhBMu4DHyVFmYmy5lmKPPBSxrqBc2lBQJiYQ8jAhsDBQsJCAcC=
AyICAQYVCgkICwIEFgIDAQIeBwIXgAAKCRDzwUsa6gXNpXgCD/i+/W+hl9c6MQjHW5kN+q5JFZ9=
MgSAMBf3phYF9RIS4Yx423F3VUJP8O8/zaDKOHc7zPa3DGpOQP2iZ2ZDU/k3RMFu2ZInMHWDUlX=
vd9kf4ajQDL+IEseIZ/FMo4
 uxHjPTgnOqVt6CZP62mBqW2T2dmzg7xsZceHx93e98Owj+Qj/yst1iV9W0IjmGqhR/aLgktbLr=
r92Aogr2xN6dDmp89DYT8AuczqDznrKXSMjx3nHcOptSkXV6eAAU2JFaDqOjCIXd8CtbslVGaoM=
k54mqJhzhhnj4+TCRGuUKOTPTMhvdTJxB5YQfG5vkwJEjceLdrFLDGVF4g7DebCdbdWkzQDgA+Z=
ZPj9s1AiEAuFMnAB8BiJB55hEQCYZ21lKVm5n/52rhnGMRDbFLo+nYXBIHQ8EUtgJqtoS8f3XAt=
T1+0CzTHKrBNn+eRwCHyGGPz0SXkVtPfimG3u1RfC1eZ5rJ83vrjtvqt8krzjq2eFCrm8+kv+M3=
H6etrrUf7fzzTaIh3j2EAO73CYP0ptVen7DdBerFzz3h6HzWdNMuCVXqxazehE53CzBfBlq2tCa=
/Gm6OqSvN7u89k0qAEpqBG2Xjh0c/vPCW+f7tVoEftcUVkGY2bX5mr0V4DN11JViLWjl5x/g8EX=
P3zUbg49uDJlo0mscXwLn/8Za0aDsFErp/cuQINBGJhDyMBEADJ1+VrnbnrbWam9T9MVOrwXTkt=
5claM/yvfmbOS7KY6xb0ZIhn2L9JZIlomknIwAQYe9Be16NnqkNP9KxK+p7C+iwGZGhHh1TNfbe=
Lbnk86pLfdjVo2QUMLHE5PwNXO3R0ofdIFBUmlA6rtpWm1hnGhp48jxwMbv5Kgcwoa0ShU4nMPI=
v2k0OhoUAs+1xbqqj/zw8IYuDMamZpDkjlOWqfiZPLJtxwDCPtM2POp/8hQoVgBlXRnQlqh0BxV=
qINK9VZ25KSxehiMN//UzgILVNy0Ana93YubvOsSmKs0ZRhrLE9WDBSi+6ehI2Q+NT11QPVTdLq=
kA+gHhjmzwCWRO4LjkdSjXGU6N5Mq/d+nxcGs6dsSuI1/iXRCUD8CCThFXWeevGi6xiZNZ9Zn6N=
BFw4SAXxjSqAPIgNPUsy2OH
 oyukLnKDa2aSs1R6OzCxtGTlWxBLjEcgNhpaAVPsQBMe1bBeS238uT03woQIHnlXtM3OK2tO7n=
aov1srgqBAnF+Js6/SElBHip7gAJDUfOvFWt57OR31Ttnfor/ztEW11/8gQArmPindOjNLFn6zm=
kZ8xZV8YDsoO/COqoAb0IIHogJdvaZgs3malZ2W/3x3KrBepXNEFJR8bMrzP8mhvX4Icxc9NTwn=
lM8Za7lxCfH5djabKGLv0p0YkktGutPjz7CwARAQABiQI2BBgBCAAgFiEEy7gMfJUWZibLmWYo8=
8FLGuoFzaUFAmJhDyMCGwwACgkQ88FLGuoFzaVu3w/+IZpSMOIYQvGBkcg9ZiEZ7qOWy9CIUEoa=
7+jvksaod5zH1wrmPIQQWWkE3Xt2Gd+jbkxVo/CwQ0mQD/Iz0cT8Dm4eA3DQNeoLyChkCVODTv4=
j72NjonlL0VUe/g0wmYdmnFYUtswiTYcTxS6X2MuV65fo8ZkW0LANd0HL5ik4DjMs8yWNGXFS4S=
0LiZlD5X3v3fEIvkVOh698N2ZVL/wz4RLx3TS7DW4hQYrvdqYfeaSHirvbMr1lZz2+2ck7oAwg4=
M2nM+ps60TKLwqwjUo59l+DrLEna2J/1acTzNE6ancUtqGucKE96LkO2+O2xUyaIMj45jmAgW6U=
c1Eo18dQxbyKtShLnY7/ghkSwQ/Syo/sFPdPIMS2Rj3N+WeFFoGRt5FVL9uxi5XNrFtE8GvwVgL=
JIMeAJc6KZfDgGtfMMNjUf8fta60RmyT/Z5cb6MsEFWZfSNX59lRL4HWHf96QFeSdJsB7eMfEwL=
l/biv1gcC2BkX4PRvU5euBhaP+u/OgmPlDp4f3BppTQjRjeQC2wkjue3bNn95xHXh4Sxa/GthlB=
TjOLBl3Oxty/Dte+1PSvI3D1FyPn9pvQeg6ovwGEVVJcWckyQTtgaWmrUzgsWexvrLixouTN584=
pAW0G3XJvZ3rrNPry9DUMG3
 p0ZW9AkVq7C3F0YSY0Tq5bKR94O8Content-Type: text/plain; charset=3DTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)=20
MIME-Version: 1.0
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>=
,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=3Dsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=3Dlp>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=3Dbscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
Return-Path: intel-gfx-bounces@lists.freedesktop.org
X-MS-Exchange-Organization-OriginalArrivalTime: 31 Mar 2024 08:22:50.6075
 (UTC)
X-MS-Exchange-Organization-Network-Message-Id: 6e10373c-01d3-4f1b-ece5-08dc=
515bc143
X-MS-Exchange-Organization-OriginalClientIPAddress: 62.96.220.37
X-MS-Exchange-Organization-OriginalServerIPAddress: 10.53.40.202
X-MS-Exchange-Organization-Cross-Premises-Headers-Processed: cas-essen-02.s=
ecunet.de
X-MS-Exchange-Organization-OrderedPrecisionLatencyInProgress: LSRV=3Dx-esse=
n-02.secunet.de:TOTAL-HUB=3D395|SMR=3D330(SMRDE=3D004|SMRC=3D325(SMRCL=3D10=
2|X-SMRCR=3D324))|CAT=3D063(CATRESL=3D023
 (CATRESLP2R=3D018)|CATORES=3D036(CATRS=3D035(CATRS-Transport Rule
 Agent=3D001(X-ETREX=3D001 )|CATRS-Index Routing
 Agent=3D033)));2024-03-31T08:22:51.016Z
X-MS-Exchange-Forest-ArrivalHubServer: mbx-essen-02.secunet.de
X-MS-Exchange-Organization-AuthSource: cas-essen-02.secunet.de
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Exchange-Organization-FromEntityHeader: Internet
X-MS-Exchange-Organization-OriginalSize: 10331
X-MS-Exchange-Organization-HygienePolicy: Standard
X-MS-Exchange-Organization-MessageLatency: SRV=CAs-essen-02.secunet.de:TOTA=
L-FE=3D012|SMR=3D007(SMRPI=3D005(SMRPI-FrontendProxyAgent=3D005))|SMS=3D005
X-MS-Exchange-Organization-Recipient-Limit-Verified: True
X-MS-Exchange-Organization-TotalRecipientCount: 1
X-MS-Exchange-Organization-Rules-Execution-History: 0b0cf904-14ac-4724-8bdf=
-482ee6223cf2%%%fd34672d-751c-45ae-a963-ed177fcabe23%%%d8080257-b0c3-47b4-b=
0db-23bc0c8ddb3c%%%95e591a2-5d7d-4afa-b1d0-7573d6c0a5d9%%%f7d0f6bc-4dcc-487=
6-8c5d-b3d6ddbb3d55%%%16355082-c50b-4214-9c7d-d39575f9f79b
X-MS-Exchange-Forest-RulesExecuted: mbx-essen-02
X-MS-Exchange-Organization-RulesExecuted: mbx-essen-02
X-MS-Exchange-Forest-IndexAgent-0: AQ0CZW4AAcgCAAAPAAADH4sIAAAAAAAEAJVTTW8a=
MRD1BpaPJdtjz9
 M7ECBppXKIVEVq1UOVqqJSr4Y1rJvFRl4Twg/r/+sbmxDUpJUqjaxl
 PPPmvTfmV3tW6poQkpxaa1MoR76UHoeitVrPlatLvcGlUTtZ0UY5bQ
 tSpkCXoQkVcl/380waJCu18Nqamna6qqj20nmSS3+AHNLXSslaAWul
 a85KjDX0Y3jrVnn20W5NIbn/MJe8pbkiOa8Uf95br3gkE9tuFhZkV0
 8jhzQrpbmr3+RZng2+6YV0haVP0i207BMw56qU1ZLsMgCEmSeEAbfW
 3is15P5bQ7Ot6tNkNLkajC4Hk3cER8bj6dWEBqOr0ahPN6WDBrspwf
 OLXpRSVbRzoDjNs2twUaH5MOeZtJcsLeHGXClD6sHDXlUwkDUwoCg0
 96J0p9Qd/dVqFra0VWV3bE2oxcTRmIE+bJyuAicovObMYRmGbQ0bt6
 ba02LrwMs/8qQFFvRP5/uMxZSOr6ZQsqi0YS6OIPFEc01IHXTXfyyV
 cZ6h88scjU/Y8yIml9O37+n77OZRyucl7e2WpGMsPCyF11Uw7E+rDc
 M9rfxkFaCCksAGNYwDEHfCtk+b6NG9rvWzf0S9x5Q14QYr8mHtpfeb
 enpxcagaPgytW10cSL7wYv7nYUaUEHkmRFOkZ6KRiLOO6OK7IZqZ6L
 VFpyXafJXgSuC2Kdq46ooMyVS0EE3RQg260B4RGiJFL5IxE5HjiV5U
 dvn2PIB3kIyVuAq9DN4Vr0ImRSpDhF6OpJEmIhUiTVp8inYv4KQiay
 TNZlARQUDgyB8/ke+I85iP6o4Sjt8APxPiDKKSVoA6j9pjAAoRoY5C
 OiKPmfgTJwKUUBANeSxuh+JgUSJyhGgE63hoEAIavQgbSeI7jjvKiQ
 5ARZPtZW6RfLQ6DGpD/OvAM3T1gjndlx3+DWpVr9apBQAAAQvYATw/
 eG1sIHZlcnNpb249IjEuMCIgZW5jb2Rpbmc9InV0Zi0xNiI/Pg0KPF
 VybFNldD4NCiAgPFZlcnNpb24+MTUuMC4wLjA8L1ZlcnNpb24+DQog
 IDxVcmxzPg0KICAgIDxVcmwgU3RhcnRJbmRleD0iODQ0IiBUeXBlPS
 JVcmwiPg0KICAgICAgPFVybFN0cmluZz5odHRwczovL21lbWJlcnMu
 eC5vcmcvPC9VcmxTdHJpbmc+DQogICAgPC9Vcmw+DQogIDwvVXJscz
 4NCjwvVXJsU2V0PgEOzwFSZXRyaWV2ZXJPcGVyYXRvciwxMCwyO1Jl
 dHJpZXZlck9wZXJhdG9yLDExLDI7UG9zdERvY1BhcnNlck9wZXJhdG
 9yLDEwLDE7UG9zdERvY1BhcnNlck9wZXJhdG9yLDExLDA7UG9zdFdv
 cmRCcmVha2VyRGlhZ25vc3RpY09wZXJhdG9yLDEwLDE7UG9zdFdvcm
 RCcmVha2VyRGlhZ25vc3RpY09wZXJhdG9yLDExLDA7VHJhbnNwb3J0
 V3JpdGVyUHJvZHVjZXIsMjAsMTcX-MS-Exchange-Forest-IndexAgent: 1 1154
X-MS-Exchange-Forest-EmailMessageHash: 6060418D
X-MS-Exchange-Forest-Language: en
X-MS-Exchange-Organization-Processed-By-Journaling: Journal Agent

This is a reminder that the membership renewal period ends in 2 days,
and elections will start after that. Please register as an X.Org
Foundation member to be able to vote in the upcoming elections. Thanks!

-Ricardo Garcia, on behalf of the X.Org elections committee.
=20
On Tue, 2024-03-26 at 11:42 -0400, Christopher Michael wrote:
> The 2024 X.Org Foundation membership renewal period has been extended=20
> one additional week and elections will start the following week on 01=20
> April 2024.
>=20
> Please note that only current members can vote in the upcoming election,=
=20
> and that the deadline for new memberships or renewals to vote in the=20
> upcoming election is 01 April 2024 at 23:59 UTC.
>=20
> If you are interested in joining the X.Org Foundation or in renewing=20
> your membership, please visit the membership system site at:=20
> https://members.x.org/
>=20
> Christopher Michael, on behalf of the X.Org elections committee
>=20
>=20
>=20

