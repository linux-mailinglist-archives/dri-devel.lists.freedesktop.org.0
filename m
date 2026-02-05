Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WcNnOxx1hGkM3AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 11:46:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579ADF1725
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 11:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D288F10E866;
	Thu,  5 Feb 2026 10:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rUPqsLIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B5E10E863;
 Thu,  5 Feb 2026 10:46:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4FF7C43D66;
 Thu,  5 Feb 2026 10:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69962C16AAE;
 Thu,  5 Feb 2026 10:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770288407;
 bh=lvjwOZpBeoLfOCmz0qi802CU+ZXxa8qVWxRNbI2stqo=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=rUPqsLIb+b/uRA0s0Xp5sV2UXcgZhox6Na7ZzRK15oB2jygIkiC4rCHgmCRWqcj/6
 9g/mO6SSHIhg/DE3XxIvbBQciNymgx7dJHfL25zOYpr3GmMa58LNE9BtuqMQxaif52
 U6jNLQh10MXNsgGZDwpavwVa3wWOpYgLQMGgg6yzmGNreEA+u5wDn5FFDuaNsYk1Kd
 bz+PLGc5pRvSc/YMcdIpb3+9v0KQvnpIKXZ6W07WuYtZgMeby2WNAXgIne2X9ycB9C
 Jjb8Jwdfha2lkmn3qmR+G7NtMld/cw4X6eoPyeSG7nuyO/H0XLF1pBqHtTfxsfYTBE
 hfDdI2Ii3NZcQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 11:46:43 +0100
Message-Id: <DG6YV5LRN0MH.150UL3H2BTHRX@kernel.org>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
Cc: "M Henning" <mhenning@darkrefraction.com>, "Karol Herbst"
 <kherbst@redhat.com>, "Lyude Paul" <lyude@redhat.com>,
 <bskeggs@nvidia.com>, <jhubbard@nvidia.com>, "Faith Ekstrand"
 <faith.ekstrand@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <CAAgWFh2dHZs2D7R4ejY9sNQ+QCtLQeGGS2PNtcsm_MPeV3edLw@mail.gmail.com>
 <Z-VX3TJPI6Tgin2G@cassiopeiae>
 <CAAgWFh3c=qE+c8Q04W2NXpBLBeXC12qTKLNmZeJA65m+dTMG8Q@mail.gmail.com>
 <Z-aDWWUTN1MBI_wl@pollux>
 <CAPM=9txXG=tqrDjhXXvfQ+eMRnsVab=xz4CBOd1Nzwu3XR+DyA@mail.gmail.com>
In-Reply-To: <CAPM=9txXG=tqrDjhXXvfQ+eMRnsVab=xz4CBOd1Nzwu3XR+DyA@mail.gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 579ADF1725
X-Rspamd-Action: no action

On Thu Feb 5, 2026 at 2:16 AM CET, Dave Airlie wrote:
> On Fri, 28 Mar 2025 at 21:09, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> (CC: Ben, John)
>>
>> On Thu, Mar 27, 2025 at 02:03:21PM -0400, M Henning wrote:
>> > On Thu, Mar 27, 2025 at 9:51=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
>> > >
>> > > On Fri, Mar 21, 2025 at 06:06:34PM -0400, M Henning wrote:
>> > > > On Thu, Mar 20, 2025 at 2:18=E2=80=AFPM Danilo Krummrich <dakr@ker=
nel.org> wrote:
>> > > > > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
>> > > > > > +     __u32 width_align_pixels;
>> > > > > > +     __u32 height_align_pixels;
>> > > > > > +     __u32 pixel_squares_by_aliquots;
>> > > > > > +     __u32 aliquot_total;
>> > > > > > +     __u32 zcull_region_byte_multiplier;
>> > > > > > +     __u32 zcull_region_header_size;
>> > > > > > +     __u32 zcull_subregion_header_size;
>> > > > > > +     __u32 subregion_count;
>> > > > > > +     __u32 subregion_width_align_pixels;
>> > > > > > +     __u32 subregion_height_align_pixels;
>> > > > > > +
>> > > > > > +     __u32 ctxsw_size;
>> > > > > > +     __u32 ctxsw_align;
>> > > > > > +};
>> > > > >
>> > > > > What if this ever changes between hardware revisions or firmware=
 versions?
>> > > >
>> > > > There was some previous discussion of that here:
>> > > > https://gitlab.freedesktop.org/mesa/mesa/-/issues/12596#note_27968=
53
>> > > >
>> > > > From what I can tell, this structure hasn't really changed since
>> > > > FERMI_C (circa 2011), so I'm not too worried about it changing on =
us
>> > > > too quickly. When it does change, we have the option of appending =
more
>> > > > members to this struct in the usual way, or if the change is more
>> > > > fundamental we can return an error from this ioctl and add a new
>> > > > interface. Userspace needs to handle an error from this ioctl
>> > > > gracefully anyway since whether it works or not depends on the gpu
>> > > > generation and what firmware is loaded right now.
>> > >
>> > > We could also define it as
>> > >
>> > >         struct drm_nouveau_get_zcull_info {
>> > >                 __u32 version;
>> > >                 __u32 _pad;
>> > >
>> > >                 union {
>> > >                         struct drm_nouveau_get_zcull_info_v1 info;
>> > >                 }
>> > >         }
>> > >
>> > > just to be safe.
>> >
>> > We can do that, although I don't see any other drm drivers using a
>> > similar pattern anywhere.
>>
>> I think it's a bit cleaner than adding new members, leave existing ones =
unset or
>> add a new IOCTL in the worst case.
>>
>> Maybe the NVIDIA folks can give us some hint on whether this is expected=
 to
>> change at some point?
>
> I think it's an ioctl, let's just leave out version/pad, adding a new
> ioctl isn't a major trouble if the world decides we need to do it.
>
> Also you can extend ioctls with new fields at the end without
> problems, so if it's just extra info it'll likely be hw specific and
> be part of enabling a new GPU.

Yeah, that's why I said "it's a bit cleaner than adding new members, leave
existing ones unset or add a new IOCTL in the worst case" above. :)

Anyways, this is quite a while ago and things have changed. I think we can
afford to be a bit less future proof in terms of new GPU (and firmware) sup=
port.
:)
