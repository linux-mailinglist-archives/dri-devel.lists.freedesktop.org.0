Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3BD632A5A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 18:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1BD10E307;
	Mon, 21 Nov 2022 17:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3D810E307
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 17:06:47 +0000 (UTC)
Date: Mon, 21 Nov 2022 17:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1669050405; x=1669309605;
 bh=Y1qd6hpSunqfKEQeDTVrK3WiCmd9fSU85MYXPvy2zF8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=HFWFys1YaBeSoqh90lGlGlkpgTeNsbnU4V3K8LaZ6Q7JSwqsQYfmlmM39dbCzZgAb
 UUlCrfeqwmOXFKlUu2isCQzgmLPKpYYyRHRVNfbYkIbLPlL86HsIWKpbb8aBf4UNlz
 M3Ibyh8p5wFCYB0J/ZUjHBUKpQvtvQO3y5qmlExXUX5J384p0JiSyG8ZD4uk4FF24n
 PNuYDibETfVC3QbM2Cjs9Lw70mLjuLcsQRYmpXluSMXgg7EdOX3BMmXMvEayXnrGNM
 g1lBUes3z4QZGvbo6DI6GklavBNtmcIYMa4jgwqRC6gMQJHNu60I7W/idxt4gpD/x5
 M17IvOW1dlP4g==
To: =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: git send-email friendly smtp provider anyone?
Message-ID: <OO82gksmp_i249qMnDryWunPoUrSyyFxpxi009wWlytDaijmvalJffHrcPyMNLdfSzcIl5reNfJ2r2SmDVSG8xYXrIIbzc9rw-_bJPMDlag=@emersion.fr>
In-Reply-To: <29wzxSbEeYmXyru0ObDIAEG_W_4Wh0qj77Y6zMgmfT6UbaftflIVKCcAdEuSsmsIoK-85IvhTC73Yh8UDm6et4EK5JZZbeeByj_j0spUc9Y=@emersion.fr>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
 <9-qCHLoI7vMtVX2UmZbrcDSyMIJRqoWx6G2sZEn08RP15vYjPwng_fInDkKYPvllUddwXshfYs_fIpPH3_TeFLat2MQx_LT5Hfb0dxb1vGA=@emersion.fr>
 <72e873e9-d4df-895b-2531-30168b8a4d64@tronnes.org>
 <29wzxSbEeYmXyru0ObDIAEG_W_4Wh0qj77Y6zMgmfT6UbaftflIVKCcAdEuSsmsIoK-85IvhTC73Yh8UDm6et4EK5JZZbeeByj_j0spUc9Y=@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, November 21st, 2022 at 18:02, Simon Ser <contact@emersion.fr> wr=
ote:

> On Monday, November 21st, 2022 at 17:52, Noralf Tr=C3=B8nnes noralf@tronn=
es.org wrote:
>=20
> > Den 21.11.2022 14.33, skrev Simon Ser:
> >=20
> > > I think you can apply for a linux.dev mailbox 1.
> >=20
> > Yeah you're right, I didn't know about that possibility.
> > But it depends on whether or not I can just use their smtp server and
> > keep my current email address. This looks like what's the problem with
> > my current ISP, I need to use the email account I have in their email
> > service (that I've never used) for sending through their smtp server,
> > but I want to send From: another email address.
>=20
> That's not possible. It breaks DKIM, so your emails will end up in Spam
> folders or be rejected. You need to use the SMTP server tied to your
> email address.

That said, you can send patches from an email address different from
the one in your patches. IOW, you can send patches committed by
<noralf@tronnes.org> from any email account.

The From in the email header won't match the commit, but the very first
line of the patch will hold that information.
