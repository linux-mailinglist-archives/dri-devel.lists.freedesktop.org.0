Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA5CA123AE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6358C10E64A;
	Wed, 15 Jan 2025 12:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="jpuLxiCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1216B10E64C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:20:20 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-6d896be3992so43817776d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 04:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1736943619; x=1737548419;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nAB9wiU4nf/DepdyNjk7NO70CuLQ2ZcDafrtyDQ7E4c=;
 b=jpuLxiCz2kxIQDUClw5s0KuKkUxn8aoicUBy0TkEUlAUIOICYlwTXP6zX0P5GSHSkK
 AXu/sVg98KMXzy1zmpZpsEtNxUNyzpVqMlio4oVV7S0686DDeIPYyMQ4B6Sr2IWfyr7D
 6daUFPUvHAPatcqqsUyfq4fZo2MJKJ/OhxS8jKbTJsdwoV+hf7q9ILjG3NoiidGzdvbf
 tSHb/hmst3h55i9XAKGEntdu90vE3ZKAKVr9CVQjkW+DzfzbM1hvUOwM8KIgW6KnF1kA
 afmyHrdSqVnA9aln61JZ+5iLuPX+W800UiwDIfK1AazerNXcnlLHNP+GMS7h+pvP7soH
 dF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736943619; x=1737548419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nAB9wiU4nf/DepdyNjk7NO70CuLQ2ZcDafrtyDQ7E4c=;
 b=PnDZcxuwRrhshGJk9NUE3y0IJ5lFyhYEe7UhPeKHlCYE1F+p7uUnKxoTucHdw1gxZd
 a/KRDV1du3bfegICVPZMu/A3shNUW+rGVOt4zkxZIvQgfUdSGeg2BkPqXl4DOw653/yR
 DT1E+74i0fj2mo7K+/ueNnJyMonHDzgwfexhIDkzpbb3BmDJd1IdzTOi1nSUDkG/E2P6
 hsYNHYxRG6QdYSh39K+j+8L6pGdUFSrfBxrDNSxY6N1DOzoBjIiUYI19PTOEM3Q/tNoi
 Vkvihwg9YrydcHKZnOk/feDRnKHMzTB2Ipk4CEx6sPbW5unZIocA0oizexa2+LBkuZL5
 KJJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfJkjUQCC1AzSd4uCJrvAh+y0UVG6YGe35FRJs/O1UJ68gobwnInZFwVuhz8l9Bv41Mu6jbiTzDKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyQl4JkyHTht7Q9MTgLXzHwWD6VaGZQZ87TBbq48P4zQstmdw7
 riNe+jdL5i/p5YTQ2bak+2JekKU6p/XJTZ2Fu9aGUca/xMHyWiueoZKv0s+ek+1u3kU/zZt1UNJ
 Kwd+nCGCWL7MTNtVJvNUkxt9+ADquB/pVUkoX4A==
X-Gm-Gg: ASbGncsouEI+oeHQtNKgbgUo9eUz5TrT2tOBqErXsbS7usNd2JLcZ7QLpIGZ5TExVFE
 geaY3zBRAHflYGN65zOjeNl880xQH8+ZsgDk=
X-Google-Smtp-Source: AGHT+IH++MvvbPX1N6C4BsVMZdJuPpHeIHlRVGwK/q1DLnsCFWiUlolSn7pCijM10VWaG92QHVc57ip1CChWurmFgfw=
X-Received: by 2002:a05:6214:242f:b0:6d8:a5da:3aba with SMTP id
 6a1803df08f44-6df9b221686mr478026176d6.20.1736943618918; Wed, 15 Jan 2025
 04:20:18 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
 <CAPj87rP4r4q-wBx1dHsEkZ7=S2c2XsbA1Pz4Skw1ETt_2yD2Ag@mail.gmail.com>
 <CAAxE2A6ghBK2VTLkNXgk1c61UG1ZQAzWQ4q=wO-OShAUC9eRmQ@mail.gmail.com>
In-Reply-To: <CAAxE2A6ghBK2VTLkNXgk1c61UG1ZQAzWQ4q=wO-OShAUC9eRmQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Jan 2025 12:20:07 +0000
X-Gm-Features: AbW1kvZypYUDzjEI4tFk9DCbDQL9wznW1ZpJeL0bmA-05bm7WepfcCFdFzlZvFM
Message-ID: <CAPj87rNFy7GLAjjxDYGLN-f8M0F7yMX6PED94O4kBJ=pwtPVyA@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Cc: James Jones <jajones@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jan 2025 at 04:05, Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wrot=
e:
> On Tue, Jan 14, 2025 at 12:58=E2=80=AFPM Daniel Stone <daniel@fooishbar.o=
rg> wrote:
>> AMD hardware is the only hardware I know of which doesn't support
>> overaligning. Say (not hypothetically) we have a GPU and a display
>> controller which have a minimum pitch alignment of 32 bytes, no
>> minimum height alignment, minimum 32-byte offset alignment, minimum
>> pitch of 32 bytes, and minimum image size of 32 bytes.
>>
>> To be maximally compatible, we'd have to expose 28 (pitch align) * 32
>> (height align) * 28 (offset align) * 28 (min pitch) * 28 (min size) =3D=
=3D
>> 19668992 individual modifiers when queried, which is 150MB per format
>> just to store the list of modifiers.
>
> Maximum compatibility is not required nor expected.
>
> In your case, only 1 linear modifier would be added for that driver, whic=
h is: [5 / 0 / 5 / 5 / 5]
>
> Then if, and only if, compatibility with other devices is desired, the dr=
iver developer could look at drivers of those other devices and determine w=
hich other linear modifiers to add. Ideally it would be just 1, so there wo=
uld be a total of 2.

Mali (actually two DRM drivers and sort of three Mesa drivers) can be
paired with any one of 11 KMS drivers (really 12 given that one is a
very independent subdriver), and something like 20 different codecs
(at least 12 different vendors; I didn't bother counting the actual
subdrivers which are all quite different). The VeriSilicon Hantro G2
codec driver is shipped by five (that we know of) vendors who all have
their own KMS drivers. One of those is in the Rockchip RK3588, which
(don't ask me why) ships six different codec blocks, with three
different drivers, from two different vendors - that's before you even
get to things like the ISP and NPU which really need to be sharing
buffers properly without copies.

So yeah, working widely without having to encode specific knowledge
everywhere isn't a nice-to-have, it's a hard baseline requirement.

>> > DRM_FORMAT_MOD_LINEAR needs to go because it prevents apps from detect=
ing whether 2 devices have 0 compatible memory layouts, which is a useful t=
hing to know.
>>
>> I get the point, but again, we have the exact same problem today with
>> placement, i.e. some devices require buffers to be in or not be in
>> VRAM or GTT or sysram for some uses, and some devices require physical
>> contiguity. Solving that problem would require an additional 4 bits,
>> which brings us to 2.3GB of modifiers per format with the current
>> scheme. Not super viable.
>
> Userspace doesn't determine placement. The kernel memory management can m=
ove buffers between heaps to accommodate sharing between devices as needed.=
 This is a problem in which userspace has no say.

It really does though!

None of these devices use TTM with placement moves, and doing that
isn't a fix either. Embedded systems have so low memory bandwidth that
the difference between choosing the wrong placement and moving it
later vs. having the right placement to begin with is the difference
between 'this does not work' and 'great, I can ship this'. Which is
great if you're a consultancy trying to get paid, but tbh I'd rather
work on more interesting things.

So yeah, userspace does very much choose the placement. On most
drivers, this is either by 'knowing' which device to allocate from, or
passing a flag to your allocation ioctl. For newer drivers though,
there's the dma-heap allocation mechanism which is now upstream and
the blessed path, for which userspace needs to explicitly know the
desired placement (and must, because fixing it up later is a
non-starter).

Given that we need to keep LINEAR ~forever for ABI reasons, and
because there's no reasonably workable alternative, let's abandon the
idea of abandoning LINEAR, and try to work with out-of-band signalling
instead.

One idea is to actually pursue the allocator idea and express this
properly through constraints. I'd be super in favour of this,
unsurprisingly, because it allows us to solve a whole pile of other
problems, rather than the extremely narrow AMD/Intel interop case.

Another idea for the out-of-band signalling would be to add
information-only modifiers, like
DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_EQ(256), or
DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_GE(32). But then that doesn't really
work at all with how people actually use modifiers: as the doc
describes, userspace takes and intersects the declared modifier lists
and passes the result through. The intersection of LINEAR+EQ256 and
LINEAR+GE32 is LINEAR, so a userspace that follows the rules will just
drop the hints on the floor and pick whatever linear allocation it
feels like.

I think I've just talked myself into the position that passing
allocator constraints together with modifiers is the only way to
actually solve this problem, at least without creating the sort of
technical debt that meant we spent years fixing up implicit/explicit
modifier interactions when it really should've just been adding a
!)@*(#$ u64 next to the u32.

Cheers,
Daniel
