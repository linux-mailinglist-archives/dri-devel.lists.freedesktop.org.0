Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1922A4CB7D9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 08:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A0B10E9CC;
	Thu,  3 Mar 2022 07:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0374B10E9CC;
 Thu,  3 Mar 2022 07:32:36 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id a23so8728632eju.3;
 Wed, 02 Mar 2022 23:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Gor8M86/GsIuBlid/S84lkBznvRDaKBCWzgLUKh5JV4=;
 b=k+fk9urovAn8Fq6hF831psJF6X0Hx41hiPVDAocMfW4Gi2tjP5gBRRyYi9UY1gS3y9
 T1f7NxhpZChRCZGs3wiKfQBYFQeu68Ugjwk2rWVNy++UqI5E9Ffm7Qe5sREsy932o9zn
 yoQiy9LiamLlfFC8y8nGBw2mIwTduboT8pHpf33UZ2RGjV2D/meZqmuHsAbl7tfxfJuC
 e8redX9TOEvOJZ9E1AYG0yGidZEg6kfprz6yLCxUQC7gampXaGyLYaXWTA6umkTeR66S
 hL8UX9htvKnv+kjTxwKZtpIsvgv4G4bDiBBsZxSW5S7a6ZZ6AFWNSxZHN5mDaVwEmoV0
 Hg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Gor8M86/GsIuBlid/S84lkBznvRDaKBCWzgLUKh5JV4=;
 b=3fAH0LtpJx9pZG98hAJzNtIR3MlQqnm+gmqqHR7toJAmofeGkcgmZ8N9RQmqFhvhu4
 QEieUZheNjbdgNSxGEgpI5myTO8KErwFqKjxWXHBpvS7k0z2Vy8Vql9wYFEyuxR1FLeb
 nTYMyU3Q52iKtKLDILONd9u/4NqBbdZrJK/rH7E9dTFirI9rHkfnpaJx2O20sIQOzamC
 oR395LiHVDF4kx2zMzCXnTxwLBgy4/oJDh+3AfKYokMnSKKOjruf4xGdRXGkBKmaftMW
 vSWv3/VBWFXDD2xpjpgp3AeZW9p1sX3bBL5MW1fo43j05AnCLGerbUmP1BljZh3gg2DX
 W8tQ==
X-Gm-Message-State: AOAM533qNquOcbMivBvQRAA1jX3Xrf0KK9OSudaXkjJ7jnuNu71HtlNI
 TU1vIeCBq3Uh8eUzraPEZgk=
X-Google-Smtp-Source: ABdhPJzeteUoFgq8PxHWf79kt1+XNtdp+qSeHQzci99kHRtMUTD40dS4a5KNav7C0/39ueCDeIyc3w==
X-Received: by 2002:a17:906:7c93:b0:6cd:341a:a1d5 with SMTP id
 w19-20020a1709067c9300b006cd341aa1d5mr25639417ejo.698.1646292754302; 
 Wed, 02 Mar 2022 23:32:34 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:896:faf2:6663:1f74])
 by smtp.gmail.com with ESMTPSA id
 gj18-20020a170907741200b006da82539c83sm410819ejc.73.2022.03.02.23.32.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Mar 2022 23:32:33 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
Date: Thu, 3 Mar 2022 08:32:31 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <A568BD90-FE81-4740-B1D3-C795EB636A5A@gmail.com>
References: <1077f17e50d34dc2bbfdf4e52a1cb2fd@AcuMS.aculab.com>
 <20220303022729.9321-1-xiam0nd.tong@gmail.com>
 <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
To: David Laight <David.Laight@ACULAB.COM>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "gustavo@embeddedor.com" <gustavo@embeddedor.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "c.giuffrida@vu.nl" <c.giuffrida@vu.nl>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "h.j.bos@vu.nl" <h.j.bos@vu.nl>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "bjohannesmeyer@gmail.com" <bjohannesmeyer@gmail.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "rppt@kernel.org" <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On 3. Mar 2022, at 05:58, David Laight <David.Laight@ACULAB.COM> =
wrote:
>=20
> From: Xiaomeng Tong
>> Sent: 03 March 2022 02:27
>>=20
>> On Wed, 2 Mar 2022 14:04:06 +0000, David Laight
>> <David.Laight@ACULAB.COM> wrote:
>>> I think that it would be better to make any alternate loop macro
>>> just set the variable to NULL on the loop exit.
>>> That is easier to code for and the compiler might be persuaded to
>>> not redo the test.
>>=20
>> No, that would lead to a NULL dereference.
>=20
> Why, it would make it b ethe same as the 'easy to use':
> 	for (item =3D head; item; item =3D item->next) {
> 		...
> 		if (...)
> 			break;
> 		...
> 	}
> 	if (!item)
> 		return;
>=20
>> The problem is the mis-use of iterator outside the loop on exit, and
>> the iterator will be the HEAD's container_of pointer which pointers
>> to a type-confused struct. Sidenote: The *mis-use* here refers to
>> mistakely access to other members of the struct, instead of the
>> list_head member which acutally is the valid HEAD.
>=20
> The problem is that the HEAD's container_of pointer should never
> be calculated at all.
> This is what is fundamentally broken about the current definition.
>=20
>> IOW, you would dereference a (NULL + offset_of_member) address here.
>=20
> Where?
>=20
>> Please remind me if i missed something, thanks.
>>=20
>> Can you share your "alternative definitions" details? thanks!
>=20
> The loop should probably use as extra variable that points
> to the 'list node' in the next structure.
> Something like:
> 	for (xxx *iter =3D head->next;
> 		iter =3D=3D &head ? ((item =3D NULL),0) : ((item =3D =
list_item(iter),1));
> 		iter =3D item->member->next) {
> 	   ...
> With a bit of casting you can use 'item' to hold 'iter'.

I think this would make sense, it would mean you only assign the =
containing
element on valid elements.

I was thinking something along the lines of:

#define list_for_each_entry(pos, head, member)					=
\
	for (struct list_head *list =3D head->next, typeof(pos) pos;	=
\
	     list =3D=3D head ? 0 : (( pos =3D list_entry(pos, list, =
member), 1));	\
	     list =3D list->next)

Although the initialization block of the for loop is not valid C, I'm
not sure there is any way to declare two variables of a different type
in the initialization part of the loop.

I believe all this does is get rid of the &pos->member =3D=3D (head) =
check
to terminate the list.
It alone will not fix any of the other issues that using the iterator
variable after the loop currently has.


AFAIK Adri=C3=A1n Moreno is working on doing something along those lines
for the list iterator in openvswitch (that was similar to the kernel
one before) [1].

I *think* they don't declare 'pos' within the loop which we *do want*
to avoid any uses of it after the loop.
(If pos is not declared in the initialization block, shadowing the
*outer* pos, it would just point to the last element of the list or stay
uninitialized if the list is empty).


[1] https://www.mail-archive.com/ovs-dev@openvswitch.org/msg63497.html


>=20
>>=20
>>> OTOH there may be alternative definitions that can be used to get
>>> the compiler (or other compiler-like tools) to detect broken code.
>>> Even if the definition can't possibly generate a working kerrnel.
>>=20
>> The "list_for_each_entry_inside(pos, type, head, member)" way makes
>> the iterator invisiable outside the loop, and would be catched by
>> compiler if use-after-loop things happened.
>=20
> It is also a compete PITA for anything doing a search.
>=20
> 	David
>=20
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, =
MK1 1PT, UK
> Registration No: 1397386 (Wales)
>=20

- Jakob=
