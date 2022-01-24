Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172C9498A80
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 20:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309CA10E3D1;
	Mon, 24 Jan 2022 19:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A23F10E3D1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 19:05:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A6AE1F37D;
 Mon, 24 Jan 2022 19:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643051130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1zh59/pJI7EaZBSgzjE5vvArmlZWtdoTZrOJLYIPIsU=;
 b=Pk3svNQ7HXYj9CSh1aWZrVtmLbzozIt3PXt69SBUuUEuve8xC4GnjYTak4jPAW8Zsat5Yj
 0E6Ns6stnBIY34sHjQDvOUBdYOca9TBjWtDchyjdXr8elbNe3/t0c1gUTWgUt+NtORtMM/
 9IC1AxyyQN7lbseU13WeHPYLQL9Q7PI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643051130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1zh59/pJI7EaZBSgzjE5vvArmlZWtdoTZrOJLYIPIsU=;
 b=reN9RPjKoyPeBOWqqtL+vOJ/OE3wnPZwH8OgDwl/OMWVp5Xbh7/KTcZpsCCdrpB2dueCBs
 b3dBbhZKjR8KqcAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2810B13C97;
 Mon, 24 Jan 2022 19:05:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pMVNCHr47mEwDwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jan 2022 19:05:30 +0000
Message-ID: <de46f070-3923-8bf3-c010-9ff4fcabcb23@suse.de>
Date: Mon, 24 Jan 2022 20:05:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
 <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
 <3f96f393-e59d-34ac-c98b-46180e2225cd@suse.de>
 <20220120125015.sx5n7ziq3765rwyo@sirius.home.kraxel.org>
 <CAKMK7uF-V20qWTxQLvTC6GjC8Sg+Pst+UJ3pWCLQ4Q7Khgy62g@mail.gmail.com>
 <CAMuHMdWS3rYUUB8HQcpjq0pY28cLiPMGrYEXeSPVtr-a_rrQvQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdWS3rYUUB8HQcpjq0pY28cLiPMGrYEXeSPVtr-a_rrQvQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OpjrWj9Nm7LGfAEzHGR8ZLZv"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OpjrWj9Nm7LGfAEzHGR8ZLZv
Content-Type: multipart/mixed; boundary="------------JvGXEhTBESSSiUWwPPOuocIu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller
 <deller@gmx.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sven Schnelle <svens@stackframe.org>
Message-ID: <de46f070-3923-8bf3-c010-9ff4fcabcb23@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
References: <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
 <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
 <3f96f393-e59d-34ac-c98b-46180e2225cd@suse.de>
 <20220120125015.sx5n7ziq3765rwyo@sirius.home.kraxel.org>
 <CAKMK7uF-V20qWTxQLvTC6GjC8Sg+Pst+UJ3pWCLQ4Q7Khgy62g@mail.gmail.com>
 <CAMuHMdWS3rYUUB8HQcpjq0pY28cLiPMGrYEXeSPVtr-a_rrQvQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWS3rYUUB8HQcpjq0pY28cLiPMGrYEXeSPVtr-a_rrQvQ@mail.gmail.com>

--------------JvGXEhTBESSSiUWwPPOuocIu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDEuMjIgdW0gMTk6Mzggc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIERhbmllbCwNCj4gDQo+IE9uIEZyaSwgSmFuIDIxLCAyMDIyIGF0IDk6NTUgQU0g
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToNCj4+IEp1c3QgdG8gY2xh
cmlmeSwgc2luY2Ugd2UgaGFkIGxvdHMgb2Ygc21hbGxlciBhbmQgYmlnZ2VyDQo+PiBtaXN1
bmRlcnN0YW5kaW5ncyBpbiB0aGUgdGhyZWFkIHRodXMgZmFyOiBEUk1fRk9STUFUX1JHQjMz
MiBleGlzdHMsIHNvDQo+PiBkcm0gc3VwcG9ydCB0aGF0IGFscmVhZHkuIFRoZSBmYmRldiBl
bXVsYXRpb24gZG9lc24ndCB5ZXQsIGJ1dCBhbGwNCj4+IHRoYXQncyBuZWVkZWQgZm9yIHRo
YXQgaXMgZmlsbGluZyBvdXQgdGhlIGNvZGUgdG8gcmVtYXAgdGhlIGRybQ0KPj4gZGVzY3Jp
cHRpb24gdG8gdGhlIGZiZGV2IGZvcm1hdCBkZXNjcmlwdGlvbiBmb3IgdGhpcyBjYXNlLiBQ
bHVzDQo+PiB0ZXN0aW5nIGl0IGFsbCB3b3JrcyBvZmMgd2l0aCBmYmNvbiBhbmQgd2hhdGVs
c2UuIE5vdGUgdGhhdCBSR0IzMzIgIGlzDQo+PiBhIGJpdCBtb3JlIHdvcmsgdGhhbiBlLmcu
IEM0LCBzaW5jZSBhdG0gZmJkZXYgc3RpbGwgdXNlcyBvbmx5IGJwcCB0bw0KPj4gaWRlbnRp
ZnkgZm9ybWF0cywgc28gd291bGQgbmVlZCB0byBiZSBzd2l0Y2ggb3ZlciB0byBkcm1fZm91
cmNjIGZpcnN0DQo+PiBiZWZvcmUgYWRkaW5nIGFueXRoaW5nIHdoaWNoIGFsaWFzZXMgd2l0
aCBzb21ldGhpbmcgZXhpc3RpbmcgKHdlIGhhdmUNCj4+IEM4IGFscmVhZHkgd2lyZWQgdXAp
Lg0KPiANCj4gSSBkb3VidCB0aGF0IFJHQjMzMiB3b3VsZCBiZSBhIGJpdCBtb3JlIHdvcmsg
dGhhbiBDNCwgYXMgUkdCMzMyIGlzIHN0aWxsDQo+IDggYnBwLCB3aGlsZSBDNCBpcyBsZXNz
LiAgVG8gc3VwcG9ydCBDNCwgYWxsIERSTSBjb2RlIHRoYXQgY2Fubm90DQo+IGhhbmRsZSBm
b3JtYXQtPmNwcFswXSA8IDEgb3IgZHJtX2Zvcm1hdF9pbmZvX2Jsb2NrX3dpZHRoKCkgPiAx
IGhhcyB0byBiZQ0KPiBmaXhlZCBmaXJzdC4NCj4gDQo+IE9uIHRoZSBwbHVzIHNpZGUsIEkg
ZmluYWxseSBnb3QgbXkgcHJvb2Ytb2YtY29uY2VwdCBBdGFyaSBEUk0gZHJpdmVyDQo+IHdv
cmtpbmcgd2l0aCBmYmNvbiBvbiBBUkFueU0uICBNYXBwaW5nIC9kZXYvZmIwIGZyb20gdXNl
cnNwYWNlIGRvZXNuJ3QNCj4gd29yayAoZmJ0ZXN0IFNFR1ZzIHdoaWxlIHJlYWRpbmcgZnJv
bSB0aGUgbWFwcGVkIGZyYW1lIGJ1ZmZlcikuICBJIGRvbid0DQo+IGtub3cgeWV0IGlmIHRo
aXMgaXMgYSBnZW5lcmFsIGlzc3VlIHdpdGhvdXQgZGVmZXJyZWQgSS9PIGluIHY1LjE3LXJj
MSwNCj4gb3IgYSBidWcgaW4gdGhlIG02OGsgTU0gY29kZS4uLg0KPiANCj4gU28gZmFyIGl0
IHN1cHBvcnRzIEM4IG9ubHksIGJ1dCBJIGhvcGUgdG8gdGFja2xlIEM0IGFuZCBtb25vY2hy
b21lIHNvb24uDQo+IFdoZXRoZXIgdGhlIGVuZCByZXN1bHQgd2lsbCBiZSB1c2FibGUgb24g
cmVhbCBoYXJkd2FyZSBpcyBzdGlsbCB0byBiZQ0KPiBzZWVuLCBidXQgYXQgbGVhc3QgSSBo
b3BlIHRvIGdldCBzb21lIERSTSBjb2RlIHdyaXR0ZW4uLi4NCg0KVGhhdCBzb3VuZHMgcHJl
dHR5IGNvb2wuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEdye29ldGplLGVl
dGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAt
LQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJ
dm8gVG90ZXYNCg==

--------------JvGXEhTBESSSiUWwPPOuocIu--

--------------OpjrWj9Nm7LGfAEzHGR8ZLZv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHu+HkFAwAAAAAACgkQlh/E3EQov+CX
DA/+MW6H0j0pJpSJgfJuknECceCVp+GaPro9vc1NYQwzt8QwKf0VRBT4P3oMY2hIQXG5jepiinER
0pBtY8CnGKllZXDLVioWa4HtHMQlNQuQq3H3OhQwgxhBAzAxo0du6rWLZVGa4pCsC6MBdkkMO+47
G4h0yfAxCm7mPh6mqI4WE07+fJAZ71XOcgunh9+ZbTq/bnq2DIHayLf/rLcJhTxArCWD6EuX2D78
5eV+E0nUfxQLdqoZB1SQsrAzPHKJwJRqBcfkOpwy0SRjKWwpnD9ZZjbOqo+U+Sqg7KicjlbLFeq2
meNeKk+o1PaHn01EFYSHnwIPXzVoo1AUB8hoWNQ6KntzN91bzOlAo2RfNtvKxSfxDkQtZwTsPkcb
Zm2qM9eKmUIqC7Cn1dg2RWzcjNezwYHQFQqXnOF/4Okb97o4iKZ8KKdMc0v79DIXZ15U7UMJHi/E
OABmEJMwK2Tt8F8cckc5AH3eLrQBUBpI+nj2QYaf864dSIv4+msGmutLgcP7rYg+RDMsiD+P8ttP
y3ntUESXd8y30LnX57sUaRjJMRQoRtPVGN7Er145AmZd/byftjvHLkI8z3ptXvWZJq8bscN7ZePI
fRlQwqxKQ4m42uRBK7gT3L0KP3m0l1n0mVO5W1hfIZCCIH5RoJRw3dhhAy7X28+WMC1pg5SNXEgt
u8o=
=acXS
-----END PGP SIGNATURE-----

--------------OpjrWj9Nm7LGfAEzHGR8ZLZv--
