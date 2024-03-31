Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7144A89329D
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 18:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A6B10EC27;
	Sun, 31 Mar 2024 16:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZBD0ycWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 601 seconds by postgrey-1.36 at gabe;
 Sun, 31 Mar 2024 16:11:36 UTC
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A310410E8CD;
 Sun, 31 Mar 2024 16:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 58711207FD;
 Sun, 31 Mar 2024 18:01:33 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Ox0wpCKl5Cx; Sun, 31 Mar 2024 18:01:30 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id BB4E020799;
 Sun, 31 Mar 2024 18:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com BB4E020799
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
 by mailout1.secunet.com (Postfix) with ESMTP id 98B4D80004A;
 Sun, 31 Mar 2024 18:01:27 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:01:27 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 15:52:48 +0000
X-sender: <xorg-devel-bounces@lists.x.org>
X-Receiver: <martin.weber@secunet.com> ORCPT=rfc822;martin.weber@secunet.com
 NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAJuYHy0vkvxLoOu7fW2WcxcPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAF4AAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249V2ViZXIgTWFydGluOTU1BQALABcAvgAAALMpUnVJ4+pPsL47FHo+lvtDTj1EQjIsQ049RGF0YWJhc2VzLENOPUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpLENOPUFkbWluaXN0cmF0aXZlIEdyb3VwcyxDTj1zZWN1bmV0LENOPU1pY3Jvc29mdCBFeGNoYW5nZSxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXNlY3VuZXQsREM9ZGUFAA4AEQBACf3SYEkDT461FZzDv+B7BQAdAA8ADAAAAG1ieC1lc3Nlbi0wMQUAPAACAAAPADYAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0Lk1haWxSZWNpcGllbnQuRGlzcGxheU5hbWUPAA0AAABXZWJlciwgTWFydGluBQAMAAIAAAUAbAACAAAFAFgAFwBGAAAAm5gfLS+S/Eug67t9bZZzF0NOPVdlYmVyIE1hcnRpbixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc2UNCg8AL
 wAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: a.mx.secunet.com
X-ExtendedProps: BQBjAAoA7mtrGbMv3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAGAAAAG1hcnRpbi53ZWJlckBzZWN1bmV0LmNvbQUABgACAAEFACkAAgABDwAJAAAAQ0lBdWRpdGVkAgABBQACAAcAAQAAAAUAAwAHAAAAAAAFAAUAAgABBQBiAAoAjQAAAO6KAAAFAGQADwADAAAASHVi
X-Source: SMTP:Default MBX-ESSEN-01
X-SourceIPAddress: 62.96.220.36
X-EndOfInjectedXHeaders: 13246
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=131.252.210.177; helo=gabe.freedesktop.org;
 envelope-from=xorg-devel-bounces@lists.x.org;
 receiver=martin.weber@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com A02E920820
X-Original-To: xorg-devel@lists.x.org
Delivered-To: xorg-devel@lists.x.org
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
 keydata=mQINBGJhDyMBEACeWT1BIJfZAtNH2wklpKt6M+XmbddnVqT+0tsPlvqlSAAvP47kJE1o4Qirosttq2C+4jH/NZleiA+ydlJV2X9wWN3Wl06Ro1yyI+RqlPP9lcciPGjpd2H6amFGxR4Tnd/t/fpu2euO8rn33n8qyLTqrJEhAFoAmZUUVzthCmIwCIf2DWTjuKUW9sCMrE5p4ybRobdT0/oTHobPfXvAhjawZeCnJ0Gs776kY6eiOLvTm2oZ0I0szG09aehtEZ5RuDgrCGkDrDGojaFnpT6h9gPtk6afa9f2Aaea3P1V3J4nRSId3NMv/Z3SIl91AeOyzUHqtix7Qs7K0pjbLlhQscwlPdkVTi17gOUl+8cVvI88yfIrbkOiGa40mPiSFyffIAZNyn25bZSk8P+6LdfUroeyOvJFTCkOHUElOO6HHcauBE6zLkroq17hbC2HCvgE9aP1BLN9UY2m6pqlkt+Psekz8QGwJUM+6hP39t6w5ADp41RAY/W2G0Sl6LGpDq7BjrMttFCpzPvovO+eGk6ZkmLnkzJ4Tl6UNRVqQVuJesJzabPkRwR3R18ZzRraLkZDtQFblRZG1dSXJuzvgYfC4qiRGEwTaeF/Zcwuc6BbDOUNfzI6x/1JLl4nYDVBdQZzCFdamKdfmZoQ5obidgwjMmb+dSc0tZDQ43jpu0S+W0J9nwARAQABtCNSaWNhcmRvIEdhcmNpYSA8cmdhcmNpYUBpZ2FsaWEuY29tPokCUQQTAQgAPBYhBMu4DHyVFmYmy5lmKPPBSxrqBc2lBQJiYQ8jAhsDBQsJCAcCAyICAQYVCgkICwIEFgIDAQIeBwIXgAAKCRDzwUsa6gXNpXgCD/i+/W+hl9c6MQjHW5kN+q5JFZ9MgSAMBf3phYF9RIS4Yx423F3VUJP8O8/zaDKOHc7zPa3DGpOQP2iZ2ZDU/k3RMFu2ZInMHWDUlXvd9kf4ajQDL+IEseIZ/FMo4
 uxHjPTgnOqVt6CZP62mBqW2T2dmzg7xsZceHx93e98Owj+Qj/yst1iV9W0IjmGqhR/aLgktbLrr92Aogr2xN6dDmp89DYT8AuczqDznrKXSMjx3nHcOptSkXV6eAAU2JFaDqOjCIXd8CtbslVGaoMk54mqJhzhhnj4+TCRGuUKOTPTMhvdTJxB5YQfG5vkwJEjceLdrFLDGVF4g7DebCdbdWkzQDgA+ZZPj9s1AiEAuFMnAB8BiJB55hEQCYZ21lKVm5n/52rhnGMRDbFLo+nYXBIHQ8EUtgJqtoS8f3XAtT1+0CzTHKrBNn+eRwCHyGGPz0SXkVtPfimG3u1RfC1eZ5rJ83vrjtvqt8krzjq2eFCrm8+kv+M3H6etrrUf7fzzTaIh3j2EAO73CYP0ptVen7DdBerFzz3h6HzWdNMuCVXqxazehE53CzBfBlq2tCa/Gm6OqSvN7u89k0qAEpqBG2Xjh0c/vPCW+f7tVoEftcUVkGY2bX5mr0V4DN11JViLWjl5x/g8EXP3zUbg49uDJlo0mscXwLn/8Za0aDsFErp/cuQINBGJhDyMBEADJ1+VrnbnrbWam9T9MVOrwXTkt5claM/yvfmbOS7KY6xb0ZIhn2L9JZIlomknIwAQYe9Be16NnqkNP9KxK+p7C+iwGZGhHh1TNfbeLbnk86pLfdjVo2QUMLHE5PwNXO3R0ofdIFBUmlA6rtpWm1hnGhp48jxwMbv5Kgcwoa0ShU4nMPIv2k0OhoUAs+1xbqqj/zw8IYuDMamZpDkjlOWqfiZPLJtxwDCPtM2POp/8hQoVgBlXRnQlqh0BxVqINK9VZ25KSxehiMN//UzgILVNy0Ana93YubvOsSmKs0ZRhrLE9WDBSi+6ehI2Q+NT11QPVTdLqkA+gHhjmzwCWRO4LjkdSjXGU6N5Mq/d+nxcGs6dsSuI1/iXRCUD8CCThFXWeevGi6xiZNZ9Zn6NBFw4SAXxjSqAPIgNPUsy2OH
 oyukLnKDa2aSs1R6OzCxtGTlWxBLjEcgNhpaAVPsQBMe1bBeS238uT03woQIHnlXtM3OK2tO7naov1srgqBAnF+Js6/SElBHip7gAJDUfOvFWt57OR31Ttnfor/ztEW11/8gQArmPindOjNLFn6zmkZ8xZV8YDsoO/COqoAb0IIHogJdvaZgs3malZ2W/3x3KrBepXNEFJR8bMrzP8mhvX4Icxc9NTwnlM8Za7lxCfH5djabKGLv0p0YkktGutPjz7CwARAQABiQI2BBgBCAAgFiEEy7gMfJUWZibLmWYo88FLGuoFzaUFAmJhDyMCGwwACgkQ88FLGuoFzaVu3w/+IZpSMOIYQvGBkcg9ZiEZ7qOWy9CIUEoa7+jvksaod5zH1wrmPIQQWWkE3Xt2Gd+jbkxVo/CwQ0mQD/Iz0cT8Dm4eA3DQNeoLyChkCVODTv4j72NjonlL0VUe/g0wmYdmnFYUtswiTYcTxS6X2MuV65fo8ZkW0LANd0HL5ik4DjMs8yWNGXFS4S0LiZlD5X3v3fEIvkVOh698N2ZVL/wz4RLx3TS7DW4hQYrvdqYfeaSHirvbMr1lZz2+2ck7oAwg4M2nM+ps60TKLwqwjUo59l+DrLEna2J/1acTzNE6ancUtqGucKE96LkO2+O2xUyaIMj45jmAgW6Uc1Eo18dQxbyKtShLnY7/ghkSwQ/Syo/sFPdPIMS2Rj3N+WeFFoGRt5FVL9uxi5XNrFtE8GvwVgLJIMeAJc6KZfDgGtfMMNjUf8fta60RmyT/Z5cb6MsEFWZfSNX59lRL4HWHf96QFeSdJsB7eMfEwLl/biv1gcC2BkX4PRvU5euBhaP+u/OgmPlDp4f3BppTQjRjeQC2wkjue3bNn95xHXh4Sxa/GthlBTjOLBl3Oxty/Dte+1PSvI3D1FyPn9pvQeg6ovwGEVVJcWckyQTtgaWmrUzgsWexvrLixouTN584pAW0G3XJvZ3rrNPry9DUMG3
 p0ZW9AkVq7C3F0YSY0Tq5bKR94O8=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 31 Mar 2024 08:34:36 +0000
X-BeenThere: xorg-devel@lists.x.org
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

