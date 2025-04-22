Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A33CA964B4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 11:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E5D10E1EA;
	Tue, 22 Apr 2025 09:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECD610E1EA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 09:41:46 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-86715793b1fso1722064241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 02:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745314903; x=1745919703;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HtDPN0f0mJZSQySCDGpLuMV+cPQyuwPvJZF9dRzKPOc=;
 b=TGV774Z1GimuxM2xktl/M2bTu8Zszl0xNECjrEaigyh6bsGB/6C+Qlzzbr0TNWkMkr
 BVzf/nmdJPVVWU5YB2yL4gJNVbl2HlakgDJDviUwP6mfXQSluGNKujXpsmN/qFY83m+z
 11Dtgh6ckIcl6fWUwR+sx7ubVVkyNeyPStF/pyoKhjp1qGFUstkPqtIzzYciKdeIVxv7
 hJIVjji76qIFYkZhV3nrEZS8KEFZREH1E6ERUBSFPGvV59Fdx1+Yl8FM+/iWx6q6BwN8
 zqBO3Y987YVf954cWZY3p5o8QB9X2NVMAyl7qTqyM/qxa1uX4umtIAXf7gI2svqdazg0
 /84A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX96iO7P5y6TKfmrebg7NHIr/LW+Up7O5rV9kWOij09wjLajFQ+Y8VUWj4lfEGh4TOJd2+4TttVFuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx43qRIS//T713IyhX6ZjRroU1f5KFXiSfg3l639IDGbhnDP0yV
 Rw8cTXtz3SWRjUaYNUi2MfH3yIBacj+r823nIXeMIQNL9BPrB9YO4nB+0tQj
X-Gm-Gg: ASbGncvF+2IUB6NAX364RJtMItIZM/LyyIvP2UOkS4sGQYk+cQAdW9XPd2ba+j1+faX
 Q2OFwkrD4RyB762sZTShD9nl83bN1csH1fFuggbhsNIL7pkw2zMhXkpwhm4dexa6iLhhGYYH/N8
 BoQhfUDrrTKm7+Be2hsXPoHrMSndt3V8yLEacIsk4GLih47cbjVz/YYVp434MxFQZWP9GvqsY5l
 N37pvV67h5jPp1o7g06TKRF67TzsUg1in9ERtId928DwCrr95eSWImHtQCybA0x6jtWR/eCEWYe
 qltyozS6WXo5LEB4q49wZVCTnjEJTN5c3BCDN84nxKfYCphHZeyqnMiCxqzrM6wDm4dKjtVU8o1
 fC6hfNFg=
X-Google-Smtp-Source: AGHT+IEZtI8dsM7m0AoWJi7DV6SkpO5lwub1QXMuH1OoMkLA9I7BCB9o/yWajY9MJ7SdDr9OaVnpYA==
X-Received: by 2002:a05:6102:5616:b0:4bb:e14a:944b with SMTP id
 ada2fe7eead31-4cb801d00f6mr7399640137.20.1745314902913; 
 Tue, 22 Apr 2025 02:41:42 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com.
 [209.85.221.173]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8776468ca4csm2239897241.15.2025.04.22.02.41.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 02:41:42 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-523d8c024dfso1877818e0c.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 02:41:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCAevN+vnlGyS2JZlDPwXdt4xKxOGtMWtNNNtgHBXWa0GqFlq+ozdgqu5P9EQ6C/mUJ02KAaNfWbc=@lists.freedesktop.org
X-Received: by 2002:a05:6122:da3:b0:523:e9d2:404d with SMTP id
 71dfb90a1353d-52925508a15mr11639393e0c.11.1745314901637; Tue, 22 Apr 2025
 02:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250327112009.6b4dc430@eldfell>
 <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
 <20250327175842.130c0386@eldfell>
 <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
 <20250331105446.098f0fbe@eldfell>
 <20250331082135.GB13690@pendragon.ideasonboard.com>
 <20250331135337.61934003@eldfell> <20250401162732.731ef774@eldfell>
 <73bd6628-374d-417f-a30f-88a4b1d157bb@ideasonboard.com>
 <20250417111315.62a749e5@eldfell>
 <20250421145039.GA19213@pendragon.ideasonboard.com>
 <20250422121107.572cb7ad@eldfell>
In-Reply-To: <20250422121107.572cb7ad@eldfell>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 11:41:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+yaw_PYsM_N8Gzrt2hbn_5cRN375jLKpwE13ygTvwHA@mail.gmail.com>
X-Gm-Features: ATxdqUG4PO00LgIbFApc_8Si6w6Y5yiIk6lKKJquY2wvCceeJmyU4SVfFA6n4dQ
Message-ID: <CAMuHMdX+yaw_PYsM_N8Gzrt2hbn_5cRN375jLKpwE13ygTvwHA@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Pekka,

On Tue, 22 Apr 2025 at 11:11, Pekka Paalanen
<pekka.paalanen@haloniitty.fi> wrote:
> On Mon, 21 Apr 2025 17:50:39 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > On Thu, Apr 17, 2025 at 11:13:15AM +0300, Pekka Paalanen wrote:
> > > On Wed, 16 Apr 2025 11:59:43 +0300 Tomi Valkeinen wrote:
> > > > On 01/04/2025 16:27, Pekka Paalanen wrote:
> > > > > On Mon, 31 Mar 2025 13:53:37 +0300 Pekka Paalanen wrote:
> > > > >> On Mon, 31 Mar 2025 11:21:35 +0300 Laurent Pinchart wrote:
> > > > >>> On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen wrote:
> > > > >>>> On Thu, 27 Mar 2025 17:35:39 +0100 Geert Uytterhoeven wrote:
> > > > >>>>> On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen wrote:
> > > > >>>>>> On Thu, 27 Mar 2025 16:21:16 +0200 Tomi Valkeinen wrote:
> > > > >>>>>>> On 27/03/2025 11:20, Pekka Paalanen wrote:
> > > > >>>>>>>> On Wed, 26 Mar 2025 15:55:18 +0200 Tomi Valkeinen wrote:
> > > > >>>>>>>>> On 26/03/2025 15:52, Geert Uytterhoeven wrote:
> > > > >>>>>>>>>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen wrote:
> > > > >>>>>>>>>>> Add greyscale Y8 format.
> > > > >>>>>>>>>>>
> > > > >>>>>>>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > >>>>>>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> Thanks for your patch!
> > > > >>>>>>>>>>
> > > > >>>>>>>>>>> --- a/include/uapi/drm/drm_fourcc.h
> > > > >>>>>>>>>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > > >>>>>>>>>>> @@ -405,6 +405,9 @@ extern "C" {
> > > > >>>>>>>>>>>     #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > > > >>>>>>>>>>>     #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > > > >>>>>>>>>>>
> > > > >>>>>>>>>>> +/* Greyscale formats */
> > > > >>>>>>>>>>> +
> > > > >>>>>>>>>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > > > >>>>>>>>>> the number of bits in the FOURCC format. What do you envision
> > > > >>>>>>>>>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?
> > > > >>>>>>>>>
> > > > >>>>>>>>> I wanted to use the same fourcc as on V4L2 side. Strictly speaking it's
> > > > >>>>>>>>> not required, but different fourccs for the same formats do confuse.
> > > > >>>>>>>>>
> > > > >>>>>>>>> So, generally speaking, I'd pick an existing fourcc from v4l2 side if
> > > > >>>>>>>>> possible, and if not, invent a new one.
> > > > >>>>>>>>
> > > > >>>>>>>> what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y8?
> > > > >>>>>>>>
> > > > >>>>>>>> Is the difference that when R8 gets expanded to RGB, it becomes (R, 0,
> > > > >>>>>>>> 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 are
> > > > >>>>>>>> defined by MatrixCoefficients (H.273 terminology)?
> > > > >>>>>>>>
> > > > >>>>>>>> That would be my intuitive assumption following how YCbCr is handled.
> > > > >>>>>>>> Is it obvious enough, or should there be a comment to that effect?
> > > > >>>>>>>
> > > > >>>>>>> You raise an interesting point. Is it defined how a display driver, that
> > > > >>>>>>> supports R8 as a format, shows R8 on screen? I came into this in the
> > > > >>>>>>> context of grayscale formats, so I thought R8 would be handled as (R, R,
> > > > >>>>>>> R) in RGB. But you say (R, 0, 0), which... also makes sense.
> > > > >>>>>>
> > > > >>>>>> That is a good question too. I based my assumption on OpenGL behavior
> > > > >>>>>> of R8.
> > > > >>>>>>
> > > > >>>>>> Single channel displays do exist I believe, but being single-channel,
> > > > >>>>>> expansion on the other channels is likely meaningless. Hm, but for the
> > > > >>>>>> KMS color pipeline, it would be meaningful, like with a CTM.
> > > > >>>>>> Interesting.
> > > > >>>>>>
> > > > >>>>>> I don't know. Maybe Geert does?
> > > > >>>>>
> > > > >>>>> I did some digging, and was a bit surprised that it was you who told
> > > > >>>>> me to use R8 instead of Y8?
> > > > >>>>> https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell
> > > > >>>>
> > > > >>>> Hi Geert,
> > > > >>>>
> > > > >>>> indeed I did. I never thought of the question of expansion to R,G,B
> > > > >>>> before. Maybe that expansion is what spells R8 and Y8 apart?
> > > > >>>>
> > > > >>>> I do think that expansion needs to be specified, so that the KMS color
> > > > >>>> pipeline computations are defined. There is a big difference between
> > > > >>>> multiplying these with an arbitrary 3x3 matrix (e.g. CTM):
> > > > >>>>
> > > > >>>> - (R, 0, 0)
> > > > >>>> - (R, R, R)
> > > > >>>> - (c1 * Y, c2 * Y, c3 * Y)
> > > > >>>
> > > > >>> I'd be very surprised by an YUV to RGB conversion matrix where the first
> > > > >>> column would contain different values. What we need to take into account
> > > > >>> though is quantization (full vs. limited range).
> > > > >
> > > > > Quantization range is indeed good to note. R8 would be always full
> > > > > range, but Y8 would follow COLOR_RANGE property.
> > > > >
> > > > >> That makes Y8 produce (Y, Y, Y), and we have our answer: R8 should be
> > > > >> (R, 0, 0), so we have both variants.
> > > > >>
> > > > >> Can we specify Y, R, G and B be nominal values in the range 0.0 - 1.0
> > > > >> in the KMS color processing?
> > > > >
> > > > > I think this 0.0 - 1.0 nominal range definition for the abstract KMS
> > > > > color processing is necessary.
> > > > >
> > > > > It also means that limited range Y8 data, when containing values 0-15
> > > > > or 240-255, would produce negative and greater than 1.0 values,
> > > > > respectively. They might get immediately clamped to 0.0 - 1.0 with the
> > > > > first color operation they face, though, but the concept seems
> > > > > important and carrying over to the new color pipelines UAPI which might
> > > > > choose not to clamp.
> > > >
> > > > Is the behavior of values outside the limited range something that needs
> > > > to be defined? We can't know how each piece of HW behaves with
> > > > "undefined" input, so should we not just define the behavior as platform
> > > > specific?
> > >
> > > Hi Tomi,
> > >
> > > it's not undefined nor illegal input in general. The so-called
> > > sub-black and super-white ranges exist for a reason, and they are
> > > intended to be used in video processing to avoid clipping in
> > > intermediate processing steps when a filter overshoots a bit. There are
> > > also practices that depend on them, like PLUGE calibration with
> > > traditional signals on a display: https://www.itu.int/rec/R-REC-BT.814
> > >
> > > I think it would be really good to have defined behaviour if at all
> > > possible.
> > >
> > > > In any case: I can't say I fully understood all the discussions wrt.
> > > > color spaces. But my immediate interest is, of course, this series =).
> > > > So is there something that you think should be improved here?
> > >
> > > Right, the range discussion is a tangent and applies to all YUV
> > > formats, so it's not a new question.
> > >
> > > > My understanding is that the Y-only pixel formats behave in a well
> > > > defined way (or, as well defined as the YUV formats), and there's
> > > > nothing more to add here. Is that right?
> > >
> > > There are two things:
> > >
> > > - Y8 follows COLOR_RANGE property, just like all other YUV formats.
> > > - Y8 implies that Cb and Cr are both neutral (0.0 in nominal values).
> > >
> > > I'd like these explicitly written down, so that they become obvious to
> > > everyone. I suspect either one might be easy to forget when writing
> > > code and taking shortcuts without thinking.
> > >
> > >
> > > Laurent,
> > >
> > > I did find a case where (Y', neutral, neutral) does *not* seem to expand
> > > to RGB=(Y, Y, Y): ICtCp. The conversion from ICtCp to L'M'S' does
> > > produce (Y', Y', Y'), but the LMS-to-RGB matrix scrambles it.
> > >
> > > I didn't dig through BT.2020 constant-luminance Y'C'bcC'rc, but I
> > > wouldn't be surprised if it scrambled too.
> > >
> > > Of course, both of the above are not just one matrix. They require two
> > > matrices and the transfer characteristic each to compute. KMS color
> > > operations cannot implement those today, but with the colorop pipelines
> > > they will if the hardware does it.
> > >
> > > That's why I think it's important to document the assumption of Cb and
> > > Cr when not part of the pixel format, and not write down a specific
> > > expansion to RGB like (Y, Y, Y).
> >
> > Every time I discuss color spaces, the scopes of "RGB" and "YUV" seem to
> > expand more and more. This makes me wonder how we define those two
> > concepts. Taking the conversion from RGB to ICtCp as an example, would
> > you consider LMS and L'M'S' as "RGB" formats, and ICtCp as a "YUV"
> > format ?
>
> sorry for the confusion. In this specific context, my use of RGB and
> YUV refers to the channels in DRM pixel formats. It might have been
> better if all channels in all pixel formats were "anonymous" and merely
> numbered because all formats can be used for any color model, but this
> is what we have.
>
> There is some disambiguation in
> https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/pixels_color.md
> The doc is some years old, so nowadays I might phrase things
> differently, but maybe it's easier to read for those new to things as I
> wrote it when I was just learning things.
>
> I would classify ICtCp in the YUV pixel format category, because the
> CtCp plane can be sub-sampled (right?). I would classify LMS and L'M'S'
> in the RGB pixel format category because they are not sub-sampled AFAIK
> although they also do not actually appear as buffer contents, so the
> relation to pixel formats is... theoretical.
>
> IOW, we have a completely artificial split of DRM pixel formats to RGB
> and YUV where the only essential difference is that YUV formats can have
> sub-sampled variants and RGB formats do not.

RGB can be subsampled, too...
https://en.wikipedia.org/wiki/Bayer_filter

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
