Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96326A167C9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 08:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D82510E357;
	Mon, 20 Jan 2025 07:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pDyznBWq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9niHqFSd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pDyznBWq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9niHqFSd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEA510E356
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 07:58:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ADB521F79F;
 Mon, 20 Jan 2025 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737359900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9NkoZJk2FXErj69xLFgw3HCJyuWx0aNFkntqUIqR1Ww=;
 b=pDyznBWqmJDHovX7lCRWcbqiXqg8HRo4Hv8Rtpt+D1FjlqFqCudMOkGn6v778Axguq6h4x
 vHLVahuGokKhKuAJY0IpoLTktscQ29njLUfBpVmWa0z5fODgmW7qFKEICJ5Dxg+wx9WKMs
 9qumQvhjyqYxMRPMQ20vrsiTLn9krhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737359900;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9NkoZJk2FXErj69xLFgw3HCJyuWx0aNFkntqUIqR1Ww=;
 b=9niHqFSdAN0eSFbePvFfUYmF7OrTPVZAHYNLZ7S0kjTSgFVqkhpIT36aSrlXqKieMp0TzA
 RhVE/lObVmcTR5CQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pDyznBWq;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9niHqFSd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737359900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9NkoZJk2FXErj69xLFgw3HCJyuWx0aNFkntqUIqR1Ww=;
 b=pDyznBWqmJDHovX7lCRWcbqiXqg8HRo4Hv8Rtpt+D1FjlqFqCudMOkGn6v778Axguq6h4x
 vHLVahuGokKhKuAJY0IpoLTktscQ29njLUfBpVmWa0z5fODgmW7qFKEICJ5Dxg+wx9WKMs
 9qumQvhjyqYxMRPMQ20vrsiTLn9krhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737359900;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9NkoZJk2FXErj69xLFgw3HCJyuWx0aNFkntqUIqR1Ww=;
 b=9niHqFSdAN0eSFbePvFfUYmF7OrTPVZAHYNLZ7S0kjTSgFVqkhpIT36aSrlXqKieMp0TzA
 RhVE/lObVmcTR5CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65642139CB;
 Mon, 20 Jan 2025 07:58:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4KduFxwCjmdHEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jan 2025 07:58:20 +0000
Message-ID: <0e9aee49-aa69-4fb6-bab8-4624143f5267@suse.de>
Date: Mon, 20 Jan 2025 08:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Daniel Stone <daniel@fooishbar.org>, James Jones <jajones@nvidia.com>,
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
 <CAPj87rP4r4q-wBx1dHsEkZ7=S2c2XsbA1Pz4Skw1ETt_2yD2Ag@mail.gmail.com>
 <CAAxE2A6ghBK2VTLkNXgk1c61UG1ZQAzWQ4q=wO-OShAUC9eRmQ@mail.gmail.com>
 <CAPj87rNFy7GLAjjxDYGLN-f8M0F7yMX6PED94O4kBJ=pwtPVyA@mail.gmail.com>
 <Z4pmnTy1NYD3rLwS@phenom.ffwll.local>
 <CAAxE2A6iDsN=YKW2F7WyyZxn4Sw4Dr5CxZminQGwf8awBivovQ@mail.gmail.com>
Content-Language: en-US
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
In-Reply-To: <CAAxE2A6iDsN=YKW2F7WyyZxn4Sw4Dr5CxZminQGwf8awBivovQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ADB521F79F
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[11];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
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

Hi


Am 18.01.25 um 03:37 schrieb Marek Olšák:
[...]
>
> 3) Implementing DRM_FORMAT_MOD_LINEAR as having 256B pitch and offset 
> alignment. This is what we do today. Even if Intel and some AMD chips 
> can do 64B or 128B alignment, they overalign to 256B. With so many 
> AMD+NV laptops out there, NV is probably next, unless they already do 
> this in the closed source driver.

The dumb-buffer series currently being discussed on dri-devel also 
touches handling of scanline pitches. THe actual value varies with each 
driver.  Should dumb buffers use a default pitch alignment of 256 on al 
hardware?

Best regards
Thomas

>
> Marek
>
> On Fri, Jan 17, 2025 at 9:18 AM Simona Vetter <simona.vetter@ffwll.ch> 
> wrote:
>
>     On Wed, Jan 15, 2025 at 12:20:07PM +0000, Daniel Stone wrote:
>     > On Wed, 15 Jan 2025 at 04:05, Marek Olšák <maraeo@gmail.com> wrote:
>     > > On Tue, Jan 14, 2025 at 12:58 PM Daniel Stone
>     <daniel@fooishbar.org> wrote:
>     > >> AMD hardware is the only hardware I know of which doesn't support
>     > >> overaligning. Say (not hypothetically) we have a GPU and a
>     display
>     > >> controller which have a minimum pitch alignment of 32 bytes, no
>     > >> minimum height alignment, minimum 32-byte offset alignment,
>     minimum
>     > >> pitch of 32 bytes, and minimum image size of 32 bytes.
>     > >>
>     > >> To be maximally compatible, we'd have to expose 28 (pitch
>     align) * 32
>     > >> (height align) * 28 (offset align) * 28 (min pitch) * 28 (min
>     size) ==
>     > >> 19668992 individual modifiers when queried, which is 150MB
>     per format
>     > >> just to store the list of modifiers.
>     > >
>     > > Maximum compatibility is not required nor expected.
>     > >
>     > > In your case, only 1 linear modifier would be added for that
>     driver, which is: [5 / 0 / 5 / 5 / 5]
>     > >
>     > > Then if, and only if, compatibility with other devices is
>     desired, the driver developer could look at drivers of those other
>     devices and determine which other linear modifiers to add. Ideally
>     it would be just 1, so there would be a total of 2.
>     >
>     > Mali (actually two DRM drivers and sort of three Mesa drivers)
>     can be
>     > paired with any one of 11 KMS drivers (really 12 given that one is a
>     > very independent subdriver), and something like 20 different codecs
>     > (at least 12 different vendors; I didn't bother counting the actual
>     > subdrivers which are all quite different). The VeriSilicon Hantro G2
>     > codec driver is shipped by five (that we know of) vendors who
>     all have
>     > their own KMS drivers. One of those is in the Rockchip RK3588, which
>     > (don't ask me why) ships six different codec blocks, with three
>     > different drivers, from two different vendors - that's before
>     you even
>     > get to things like the ISP and NPU which really need to be sharing
>     > buffers properly without copies.
>     >
>     > So yeah, working widely without having to encode specific knowledge
>     > everywhere isn't a nice-to-have, it's a hard baseline requirement.
>     >
>     > >> > DRM_FORMAT_MOD_LINEAR needs to go because it prevents apps
>     from detecting whether 2 devices have 0 compatible memory layouts,
>     which is a useful thing to know.
>     > >>
>     > >> I get the point, but again, we have the exact same problem
>     today with
>     > >> placement, i.e. some devices require buffers to be in or not
>     be in
>     > >> VRAM or GTT or sysram for some uses, and some devices require
>     physical
>     > >> contiguity. Solving that problem would require an additional
>     4 bits,
>     > >> which brings us to 2.3GB of modifiers per format with the current
>     > >> scheme. Not super viable.
>     > >
>     > > Userspace doesn't determine placement. The kernel memory
>     management can move buffers between heaps to accommodate sharing
>     between devices as needed. This is a problem in which userspace
>     has no say.
>     >
>     > It really does though!
>     >
>     > None of these devices use TTM with placement moves, and doing that
>     > isn't a fix either. Embedded systems have so low memory
>     bandwidth that
>     > the difference between choosing the wrong placement and moving it
>     > later vs. having the right placement to begin with is the difference
>     > between 'this does not work' and 'great, I can ship this'. Which is
>     > great if you're a consultancy trying to get paid, but tbh I'd rather
>     > work on more interesting things.
>     >
>     > So yeah, userspace does very much choose the placement. On most
>     > drivers, this is either by 'knowing' which device to allocate
>     from, or
>     > passing a flag to your allocation ioctl. For newer drivers though,
>     > there's the dma-heap allocation mechanism which is now upstream and
>     > the blessed path, for which userspace needs to explicitly know the
>     > desired placement (and must, because fixing it up later is a
>     > non-starter).
>     >
>     > Given that we need to keep LINEAR ~forever for ABI reasons, and
>     > because there's no reasonably workable alternative, let's
>     abandon the
>     > idea of abandoning LINEAR, and try to work with out-of-band
>     signalling
>     > instead.
>     >
>     > One idea is to actually pursue the allocator idea and express this
>     > properly through constraints. I'd be super in favour of this,
>     > unsurprisingly, because it allows us to solve a whole pile of other
>     > problems, rather than the extremely narrow AMD/Intel interop case.
>     >
>     > Another idea for the out-of-band signalling would be to add
>     > information-only modifiers, like
>     > DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_EQ(256), or
>     > DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_GE(32). But then that doesn't
>     really
>     > work at all with how people actually use modifiers: as the doc
>     > describes, userspace takes and intersects the declared modifier
>     lists
>     > and passes the result through. The intersection of LINEAR+EQ256 and
>     > LINEAR+GE32 is LINEAR, so a userspace that follows the rules
>     will just
>     > drop the hints on the floor and pick whatever linear allocation it
>     > feels like.
>
>     Yeah I think latest when we also take into account logical image
>     size (not
>     just pitch) with stuff like it needs to be aligned to 2 pixels in both
>     directions just using modifiers falls apart.
>
>     And the problem with linear, unlike device modifiers is that we
>     can't just
>     throw up our hands and enumerate the handful of formats in actual
>     use for
>     interop. There's so many produces and consumers of linera buffers
>     (Daniel's list above missed camera/image processors) that save
>     assumption
>     is that anything really can happen.
>
>     > I think I've just talked myself into the position that passing
>     > allocator constraints together with modifiers is the only way to
>     > actually solve this problem, at least without creating the sort of
>     > technical debt that meant we spent years fixing up implicit/explicit
>     > modifier interactions when it really should've just been adding a
>     > !)@*(#$ u64 next to the u32.
>
>     Yeah probably.
>
>     Otoh I know inertia, so I am tempted to go with the oddball
>     LINEAR_VEDNOR_A_VENDOR_B_INTEROP thing and stretch the runway for
>     a bit.
>     And we just assign those as we go as a very special thing, and the
>     drivers
>     that support it would prefer it above just LINEAR if there's no other
>     common format left.
>
>     Also makes it really obvious what all userspace/kernel driver enabling
>     would be needed to justify such a modifier.
>     -Sima
>
>     >
>     > Cheers,
>     > Daniel
>
>     -- 
>     Simona Vetter
>     Software Engineer, Intel Corporation
>     http://blog.ffwll.ch
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

