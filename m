Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AA67C4CB0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BE010E4B0;
	Wed, 11 Oct 2023 08:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400A910E4AA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 08:12:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0029C1FDC9;
 Wed, 11 Oct 2023 08:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697011942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wiywr9+gLbSBe+93tGG5c58kLi7MXllK38988ik+Pqw=;
 b=mIiJzQS9vInHMfoDSQRK9b5aY421xK/9nurecq6CNkjP8WUEVu+IoUSe5yB1FAmwnTlfuc
 jYHjC+07msPJr8hIgdOyYe5d0XYmU0EZ5rDylWiOuvp9iERgyNN9rbqulwUW1M7C5PAsVb
 wjIYu/+zxaUZh/9dqoOjDCEUzPEZRrA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697011942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Wiywr9+gLbSBe+93tGG5c58kLi7MXllK38988ik+Pqw=;
 b=qTr0/lJrbSQKDyVRyhrGqA4qW1ul4iDBx5EiB0ur14GRkRuorMXTr9YdhE3oc2wIUH6XRe
 x7x82nLApPt7o3BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDF36138EF;
 Wed, 11 Oct 2023 08:12:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uIF7NeVYJmXrFwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Oct 2023 08:12:21 +0000
Message-ID: <4c9777c5-fcaa-4936-b1ab-93911585d3a4@suse.de>
Date: Wed, 11 Oct 2023 10:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: please backmerge drm/drm-next into drm-misc/drm-misc-next
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <d1b9b7d7-7aec-4866-ac76-e39fbacc8d7c@linaro.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <d1b9b7d7-7aec-4866-ac76-e39fbacc8d7c@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gN0Bei3rPEdKhpQJoof0Cqzs"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gN0Bei3rPEdKhpQJoof0Cqzs
Content-Type: multipart/mixed; boundary="------------dZNS0idtgy2WxaybXdp0Vu0l";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <4c9777c5-fcaa-4936-b1ab-93911585d3a4@suse.de>
Subject: Re: please backmerge drm/drm-next into drm-misc/drm-misc-next
References: <d1b9b7d7-7aec-4866-ac76-e39fbacc8d7c@linaro.org>
In-Reply-To: <d1b9b7d7-7aec-4866-ac76-e39fbacc8d7c@linaro.org>

--------------dZNS0idtgy2WxaybXdp0Vu0l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMTAuMjMgdW0gMjI6Mjcgc2NocmllYiBEbWl0cnkgQmFyeXNoa292Og0K
PiBIZWxsbywNCj4gDQo+IGRybS1taXNjLW5leHQgaXMgY3VycmVudGx5IHN0dWNrIGF0IDYu
NS1yYzIuIENvdWxkIHlvdSBwbGVhc2UgYmFja21lcmdlIA0KPiBkcm0tbmV4dCBpbnRvIGRy
bS1taXNjLW5leHQgdG8gYnJpbmcgaXQgdG8gNi42LXJjMj8gSSB3YXMgZ29pbmcgdG8gYXBw
bHkgDQo+IG9uZSBvZiB0aGUgcGVuZGluZyBzZXJpZXMgKFsxXSksIGJ1dCBnb3QgY29uZmxp
Y3RzIGJlY2F1c2Ugb2YgdGhlIA0KPiBvdXRkYXRlZCBzb3VyY2UgdHJlZS4gVGhhbmsgeW91
Lg0KDQpEb25lLg0KDQo+IA0KPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3Nlcmllcy8xMjAzOTMvI3JldjUNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1h
bnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3Vk
aWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------dZNS0idtgy2WxaybXdp0Vu0l--

--------------gN0Bei3rPEdKhpQJoof0Cqzs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUmWOUFAwAAAAAACgkQlh/E3EQov+BK
2g/8D0hnrnfA7puV3gutx2bqV5J0lo1KxKunwxVu/DbNu7Gf54E4GszMwcxwe/s9UiTw48ciljVK
gWnnwARsKz6RtxwQz1TX9PYyxa9WOorIhf+vBV/XcXViCQZQrZzR9FMXWoIrGWY720+0qq/bq0QA
ucpoQ8+sj0nEy3uNFTJ9jc0zrf1/rxNTXEVOAUmVpAoew2bVOL4Rjj2dc+BkodJRZikMgr4uF0yj
uBfqbo6qdyBUofHyE7orre/W8MTuUH3Py1X419QevYJQBgEDERvCdEiAAcdm/E6MNJElbj0HLu3b
Y4P2nTTifO4A1WbZgyxsvfuBvYC1XmGZnnCxAdmP4+zzap61BrsRTyfpywU63h7gMBo0SB0prKTs
6PDdJpUO7UFA2jwPhlP1YsEgLaReNzs9IJyO/hOvG1WhbuWCmBZg6j2/SMhmx8lFg2vi1KLZGUmZ
C7ZNjsMPehqC0njkoy7vJnZF6WslbiAWynC4Ep3yPn9wK4s77cCr4gzTNro2o7n3apFBdQo32PrD
ctIy5gw/Ckt9CK6CDCd9eUSg2rLcrWrKbAnbbLuF84OrqEzs/ez5Qvw4A3mEsFpfWN+WNv22dlAQ
FQnS4c7qTV2tlI4elqEJQhJePxtOhmVpE13ldW9UkLNk3xR58AE5adFH872tdozKh/A2U8dyelkC
plw=
=m/HU
-----END PGP SIGNATURE-----

--------------gN0Bei3rPEdKhpQJoof0Cqzs--
