Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8923B0000
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 11:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B90F89A16;
	Tue, 22 Jun 2021 09:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CF889A16
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:12:18 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 197A01FD64;
 Tue, 22 Jun 2021 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624353137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2S1GZjVV0O2eW26D/C5mP/xBfS/QZ8D4wdzglA9JkS8=;
 b=HLJG32V+C+He6nAcw1Um3uc6J4JQOnkewLRaltCeI0XGxogyC+/ibRFrxfMTwE5Sb8cL8L
 s8eZ7teby7ePFxxBgJXIdO0eyofNl6winiaJi/6+B8KF+K3gRfGNhIe5dEcJVG0hgk7Qju
 1oR/WmGhVOr5j41+AIGs2RLBo8kBm50=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624353137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2S1GZjVV0O2eW26D/C5mP/xBfS/QZ8D4wdzglA9JkS8=;
 b=m6G4l+FIBEhqEn2P3pVAPi9Edtrz0lBR/DREKWmORwciEtiaVRFWXCxavfNB2vfqQHrq3f
 agIbKULr9+h1IkDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D3F75118DD;
 Tue, 22 Jun 2021 09:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624353137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2S1GZjVV0O2eW26D/C5mP/xBfS/QZ8D4wdzglA9JkS8=;
 b=HLJG32V+C+He6nAcw1Um3uc6J4JQOnkewLRaltCeI0XGxogyC+/ibRFrxfMTwE5Sb8cL8L
 s8eZ7teby7ePFxxBgJXIdO0eyofNl6winiaJi/6+B8KF+K3gRfGNhIe5dEcJVG0hgk7Qju
 1oR/WmGhVOr5j41+AIGs2RLBo8kBm50=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624353137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2S1GZjVV0O2eW26D/C5mP/xBfS/QZ8D4wdzglA9JkS8=;
 b=m6G4l+FIBEhqEn2P3pVAPi9Edtrz0lBR/DREKWmORwciEtiaVRFWXCxavfNB2vfqQHrq3f
 agIbKULr9+h1IkDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id KiC9MnCp0WASIwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 09:12:16 +0000
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To: Esaki Tomohito <etom@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
 <85593f2f-5aa9-6023-ecba-c5275a468b71@igel.co.jp>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <bd64733a-d45c-a985-d99d-0fa70bacb001@suse.de>
Date: Tue, 22 Jun 2021 11:12:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <85593f2f-5aa9-6023-ecba-c5275a468b71@igel.co.jp>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WlcHhU6hex4h9Z0LOqBGwvBjeuF1z7K0S"
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
Cc: devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WlcHhU6hex4h9Z0LOqBGwvBjeuF1z7K0S
Content-Type: multipart/mixed; boundary="Kk1kL8IpnwdpIdgA1q2JbHjX2dsQ44t2z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Esaki Tomohito <etom@igel.co.jp>
Cc: devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Message-ID: <bd64733a-d45c-a985-d99d-0fa70bacb001@suse.de>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
References: <20210621062742.26073-1-etom@igel.co.jp>
 <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
 <85593f2f-5aa9-6023-ecba-c5275a468b71@igel.co.jp>
In-Reply-To: <85593f2f-5aa9-6023-ecba-c5275a468b71@igel.co.jp>

--Kk1kL8IpnwdpIdgA1q2JbHjX2dsQ44t2z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.06.21 um 06:02 schrieb Esaki Tomohito:
> Hi, Thomas
> Thank you for reply.
>=20
> On 2021/06/21 16:10, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 21.06.21 um 08:27 schrieb Tomohito Esaki:
>>> Virtual DRM splits the overlay planes of a display controller into
>>> multiple
>>> virtual devices to allow each plane to be accessed by each process.
>>>
>>> This makes it possible to overlay images output from multiple
>>> processes on a
>>> display. For example, one process displays the camera image without
>>> compositor
>>> while another process overlays the UI.
>>
>> I briefly looked over your patches. I didn't understand how this is
>> different to the functionality of a compositor? Shouldn't this be solv=
ed
>> in userspace?
>=20
> I think when latency is important (e.g., AR, VR, for displaying camera
> images in IVI systems), there may be use cases where the compositor
> cannot be used.
> Normally, when the image is passed through the compositor, it is
> displayed after 2 VSYNC at most, because the compositor combines the
> image with VSYNC synchronization. On the other hand, if we use vDRM, th=
e
> image will be displayed at the next VSYNC, so it will be displayed afte=
r
> 1 VSYNC at most.

Other commenters already addressed these points.

>=20
> Also, since the compositor is a single point of failure, we may not wan=
t
> to make it dependent on it.

The kernel is also a single point of failure.

TBH I don't think this feature should be merged until there's a clear=20
use case that cannot be solved in userspace idiomatically.

Best regards
Thomas

>=20
> Best regards
> Tomohito Esaki
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Kk1kL8IpnwdpIdgA1q2JbHjX2dsQ44t2z--

--WlcHhU6hex4h9Z0LOqBGwvBjeuF1z7K0S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDRqXAFAwAAAAAACgkQlh/E3EQov+Af
LhAAl2DsZ+2q/Kykruu+aUiljCoeGL+fehatgi3Qbz9LHotnb+8lcZL8qNGjphWQxLpooqeO9ZDr
WPop9s6a4mSHD9nyyvXrdWLdid5wYpmetCMH6SVXHMlVWh+n/qw9v49DtqxHEADDk5VixNgh9cxQ
RbRmOVg88YT8Z40zAZw2I6MlmIpS0SSDE5yjR3JHE6zOI6bniAdGiiCKojqoIS/Md/9g4MBjsIk2
lro7eW7ulINyEuoDnbY3M241s/cZnP/ZShARtgScL5bVhoQZ6s7YO8OISYhYdkg+eF1qi1AdsqZY
pmDLtAhZ95arQa5OIVTGewxxCG/uzbIDUh4v4lJSgBSF0SUtakCJF9Q9AhjCvW1+era0253MfyCy
/F5sndCQh/Iaqt6hpqe6ijC5RgA4Le7IUBBZV+HE48/9hRv6QqZSEVz61LvpbK2mFihJYxFPfTwS
xxa1E/+HvWDuEgUeehAWqaL07ytWPoaQBqn9nSvAtXTNPbXiknOWqW7Vq3vUMmf/zpF6mkd8R89U
um6D6/bEIu0Vd9ZK5blNbuzoX+g/qJpWU+As8jkXF1uR0tDHPq2OsokaWQ2IsDkoJT4DBzzgFcl9
RaTrRoKwCoEGIZfu1Bg4cfMPi6T0BmXiWs+psao3lp1Dwpiz8FMMRG6ObJ/0hcZ5g5B6+gugbqjb
/Og=
=+9bo
-----END PGP SIGNATURE-----

--WlcHhU6hex4h9Z0LOqBGwvBjeuF1z7K0S--
