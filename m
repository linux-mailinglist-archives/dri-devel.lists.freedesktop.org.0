Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADAAA33F16
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 13:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2183210E3BC;
	Thu, 13 Feb 2025 12:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="fH1s7c2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224A610E3BC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 12:26:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739449577; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LCnVCPRYXceLMoII+Ww17bnddWoFgXdtWRF753aoXU5eoFCOAjHb6ig3wz3qlunSwrtN5Zg7ePyr1EHuo3GNACO8tuRW0H+PMWbit0lTroclINcz01b2Cl/YeihbLiv1oVKto5iNTMyWCSa+pgU2fwLE/8m+Ga6HlXChpMhG13o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739449577;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=C3VRRUAGVxy9lGYvcqrb5mxmU7G0Wb7qsdiGCcX25Ag=; 
 b=AT6PUohhALnXW0WU3YM1RFf8WwgHUihwCxbDPYNJJL5lx5KUfC7865GsmZZFbaz3AqQ4WGmoKzw3v6/fvKblPfX33xmCW4a16F6qOYT9DiPNwExRt4Y2JVOfDy3Cg8riQUYmh8VJMywUTvjeGnfrMM0kMSl34s3UTGyhnVms/AQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739449577; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Date:Date:From:From:To:To:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=C3VRRUAGVxy9lGYvcqrb5mxmU7G0Wb7qsdiGCcX25Ag=;
 b=fH1s7c2xyAkVQ5Hl4o/SYytbyeEenmKvYCoY0YrfgJ3KDfVh/OP/l91sjUC4/+2W
 DOJGibfHWbhMM1+ktia2SK38gs+0wXCOgm+RbkGnl2eVZqjKrWJtzVPk/V/zM1bv/Fm
 8uyXvFi8NPooeioYOWQiNbNjH8jth0sp7UuyhBAT4Y+dN8YI1wv1XraljjNC4SLWmo9
 ekoWPf4Z1wEooe2C03544rJJ24OCgtIo2LmStT/mqSo2Mx0HobIf4jMJKlo/rzjnu/Q
 wUiRaXGOrg2kT+9XdMtiwWM8JA4Z6TMtvJBXR5eePQMerinZlsxkZrg7vdo19GgmB2k
 GHmyt5KdCg==
Received: by mx.zohomail.com with SMTPS id 173944957419641.347257163237714;
 Thu, 13 Feb 2025 04:26:14 -0800 (PST)
Date: Thu, 13 Feb 2025 20:26:04 +0800
From: Icenowy Zheng <uwu@icenowy.me>
To: dri-devel@lists.freedesktop.org
Subject: =?US-ASCII?Q?Re=3A_On_community_influencing_=28was_Re=3A_=5BPATCH_v8_2?=
 =?US-ASCII?Q?/2=5D_rust=3A_add_dma_coherent_allocator_abstraction=2E=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Z63YuDYEEXfurxpY@cassiopeiae>
References: <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com> <Z6bdCrgGEq8Txd-s@home.goodmis.org>
 <1e8452ab-613a-4c85-adc0-0c4a293dbf50@marcan.st>
 <07c447b77bdac1f8ade1f93456f853f89d4842ee.camel@icenowy.me>
 <Z6nTxks3u-ErSalQ@cassiopeiae>
 <d7d1fb8af8857e7ebfdea48213849ea9ba446477.camel@icenowy.me>
 <Z63YuDYEEXfurxpY@cassiopeiae>
Message-ID: <307B7492-EDE2-4BC7-BBD7-BF6FE1D6A82E@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
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



=E4=BA=8E 2025=E5=B9=B42=E6=9C=8813=E6=97=A5 GMT+08:00 19:34:16=EF=BC=8CDa=
nilo Krummrich <dakr@kernel=2Eorg> =E5=86=99=E9=81=93=EF=BC=9A
>On Thu, Feb 13, 2025 at 11:49:20AM +0800, Icenowy Zheng wrote:
>> =E5=9C=A8 2025-02-10=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:24 +0100=EF=
=BC=8CDanilo Krummrich=E5=86=99=E9=81=93=EF=BC=9A
>> >=20
>> > (Additionally, in this particular case even one of the reviewers of
>> > DMA MAPPING HELPERS offered to be a reviewer of the Rust abstractions
>> > too, in
>> > order to keep eye on the DMA API angle=2E)
>>=20
>> Sorry, but I did a fact check on this, and I found that the only
>> "reviewer" of DMA MAPPING HELPERS is Robin Murphy, he has only one
>> reply in this thread, and the reply only says "Indeed, FWIW it seems
>> like the appropriate level of abstraction to me,=20
>> judging by the other wrappers living in rust/kernel/ already", he
>> didn't offer to be a reviewer,
>
>As Abdiel pointed out already, he did offer it in [1]=2E
>
>But that's not the relevant part, but I think how you handled being in do=
ubt is
>relevant=2E
>
>I think the correct way would have been to just ask for a pointer that pr=
oves
>the statement in question=2E
>
>Instead you just went ahead with the big words "fact check" and then even=
 got it
>wrong=2E In your "fact check" you did not put any disclaimer to e=2Eg=2E =
indicate that
>you might not have the full picture, etc

Well I'm sorry for using a too heavy word=2E I am not native English speak=
er
and not ablr to understand its suitability well=2E

>Ultimately, the way you replied to this, comes across as an immediate acc=
use of
>lying=2E
>
>I really think that we should *not* pick up this way of arguing that nowa=
days
>became all too present=2E
>
>- Danilo
>
>[1] https://lore=2Ekernel=2Eorg/rust-for-linux/4956d01e-2d06-4edd-813b-9d=
a94b482069@arm=2Ecom/
