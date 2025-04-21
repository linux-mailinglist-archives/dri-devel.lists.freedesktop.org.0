Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85DA95313
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 16:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72FE10E476;
	Mon, 21 Apr 2025 14:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GSIQ5Lpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C2210E476
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 14:50:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73DB856D;
 Mon, 21 Apr 2025 16:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1745246917;
 bh=AYPiDAdFdvMcbSHtvlruYFEjRQl5VIn15bf/moyKBUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GSIQ5Lpjzz6evdC+AHZ2y/ana0vtKDnFhv1h2+ocK8ioR/ZjveUiPtY3YIDSzh7qP
 N+4qS15MxwxzjBRTu2d4nvY0w3ipjX0giXstZnBSt8ilraM0TB5ZGXnZyuuvzBpWsa
 Y4WNGxNN5JfnXcR9OLG6qsrmrMP5AxpMub+Cyxlg=
Date: Mon, 21 Apr 2025 17:50:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250421145039.GA19213@pendragon.ideasonboard.com>
References: <20250327112009.6b4dc430@eldfell>
 <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
 <20250327175842.130c0386@eldfell>
 <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
 <20250331105446.098f0fbe@eldfell>
 <20250331082135.GB13690@pendragon.ideasonboard.com>
 <20250331135337.61934003@eldfell> <20250401162732.731ef774@eldfell>
 <73bd6628-374d-417f-a30f-88a4b1d157bb@ideasonboard.com>
 <20250417111315.62a749e5@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417111315.62a749e5@eldfell>
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

On Thu, Apr 17, 2025 at 11:13:15AM +0300, Pekka Paalanen wrote:
> On Wed, 16 Apr 2025 11:59:43 +0300 Tomi Valkeinen wrote:
> > On 01/04/2025 16:27, Pekka Paalanen wrote:
> > > On Mon, 31 Mar 2025 13:53:37 +0300 Pekka Paalanen wrote:
> > >> On Mon, 31 Mar 2025 11:21:35 +0300 Laurent Pinchart wrote:
> > >>> On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen wrote:
> > >>>> On Thu, 27 Mar 2025 17:35:39 +0100 Geert Uytterhoeven wrote:
> > >>>>> On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen wrote:
> > >>>>>> On Thu, 27 Mar 2025 16:21:16 +0200 Tomi Valkeinen wrote:
> > >>>>>>> On 27/03/2025 11:20, Pekka Paalanen wrote:
> > >>>>>>>> On Wed, 26 Mar 2025 15:55:18 +0200 Tomi Valkeinen wrote:
> > >>>>>>>>> On 26/03/2025 15:52, Geert Uytterhoeven wrote:
> > >>>>>>>>>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen wrote:
> > >>>>>>>>>>> Add greyscale Y8 format.
> > >>>>>>>>>>>
> > >>>>>>>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>>>>>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>  
> > >>>>>>>>>>
> > >>>>>>>>>> Thanks for your patch!
> > >>>>>>>>>>         
> > >>>>>>>>>>> --- a/include/uapi/drm/drm_fourcc.h
> > >>>>>>>>>>> +++ b/include/uapi/drm/drm_fourcc.h
> > >>>>>>>>>>> @@ -405,6 +405,9 @@ extern "C" {
> > >>>>>>>>>>>     #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > >>>>>>>>>>>     #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > >>>>>>>>>>>
> > >>>>>>>>>>> +/* Greyscale formats */
> > >>>>>>>>>>> +
> > >>>>>>>>>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */  
> > >>>>>>>>>>
> > >>>>>>>>>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > >>>>>>>>>> the number of bits in the FOURCC format. What do you envision
> > >>>>>>>>>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?  
> > >>>>>>>>>
> > >>>>>>>>> I wanted to use the same fourcc as on V4L2 side. Strictly speaking it's
> > >>>>>>>>> not required, but different fourccs for the same formats do confuse.
> > >>>>>>>>>
> > >>>>>>>>> So, generally speaking, I'd pick an existing fourcc from v4l2 side if
> > >>>>>>>>> possible, and if not, invent a new one.  
> > >>>>>>>>
> > >>>>>>>> what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y8?
> > >>>>>>>>
> > >>>>>>>> Is the difference that when R8 gets expanded to RGB, it becomes (R, 0,
> > >>>>>>>> 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 are
> > >>>>>>>> defined by MatrixCoefficients (H.273 terminology)?
> > >>>>>>>>
> > >>>>>>>> That would be my intuitive assumption following how YCbCr is handled.
> > >>>>>>>> Is it obvious enough, or should there be a comment to that effect?  
> > >>>>>>>
> > >>>>>>> You raise an interesting point. Is it defined how a display driver, that
> > >>>>>>> supports R8 as a format, shows R8 on screen? I came into this in the
> > >>>>>>> context of grayscale formats, so I thought R8 would be handled as (R, R,
> > >>>>>>> R) in RGB. But you say (R, 0, 0), which... also makes sense.  
> > >>>>>>
> > >>>>>> That is a good question too. I based my assumption on OpenGL behavior
> > >>>>>> of R8.
> > >>>>>>
> > >>>>>> Single channel displays do exist I believe, but being single-channel,
> > >>>>>> expansion on the other channels is likely meaningless. Hm, but for the
> > >>>>>> KMS color pipeline, it would be meaningful, like with a CTM.
> > >>>>>> Interesting.
> > >>>>>>
> > >>>>>> I don't know. Maybe Geert does?  
> > >>>>>
> > >>>>> I did some digging, and was a bit surprised that it was you who told
> > >>>>> me to use R8 instead of Y8?
> > >>>>> https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell  
> > >>>>
> > >>>> Hi Geert,
> > >>>>
> > >>>> indeed I did. I never thought of the question of expansion to R,G,B
> > >>>> before. Maybe that expansion is what spells R8 and Y8 apart?
> > >>>>
> > >>>> I do think that expansion needs to be specified, so that the KMS color
> > >>>> pipeline computations are defined. There is a big difference between
> > >>>> multiplying these with an arbitrary 3x3 matrix (e.g. CTM):
> > >>>>
> > >>>> - (R, 0, 0)
> > >>>> - (R, R, R)
> > >>>> - (c1 * Y, c2 * Y, c3 * Y)  
> > >>>
> > >>> I'd be very surprised by an YUV to RGB conversion matrix where the first
> > >>> column would contain different values. What we need to take into account
> > >>> though is quantization (full vs. limited range).  
> > > 
> > > Quantization range is indeed good to note. R8 would be always full
> > > range, but Y8 would follow COLOR_RANGE property.
> > >   
> > >> That makes Y8 produce (Y, Y, Y), and we have our answer: R8 should be
> > >> (R, 0, 0), so we have both variants.
> > >>
> > >> Can we specify Y, R, G and B be nominal values in the range 0.0 - 1.0
> > >> in the KMS color processing?  
> > > 
> > > I think this 0.0 - 1.0 nominal range definition for the abstract KMS
> > > color processing is necessary.
> > > 
> > > It also means that limited range Y8 data, when containing values 0-15
> > > or 240-255, would produce negative and greater than 1.0 values,
> > > respectively. They might get immediately clamped to 0.0 - 1.0 with the
> > > first color operation they face, though, but the concept seems
> > > important and carrying over to the new color pipelines UAPI which might
> > > choose not to clamp.  
> > 
> > Is the behavior of values outside the limited range something that needs 
> > to be defined? We can't know how each piece of HW behaves with 
> > "undefined" input, so should we not just define the behavior as platform 
> > specific?
> 
> Hi Tomi,
> 
> it's not undefined nor illegal input in general. The so-called
> sub-black and super-white ranges exist for a reason, and they are
> intended to be used in video processing to avoid clipping in
> intermediate processing steps when a filter overshoots a bit. There are
> also practices that depend on them, like PLUGE calibration with
> traditional signals on a display: https://www.itu.int/rec/R-REC-BT.814
> 
> I think it would be really good to have defined behaviour if at all
> possible.
> 
> > In any case: I can't say I fully understood all the discussions wrt. 
> > color spaces. But my immediate interest is, of course, this series =). 
> > So is there something that you think should be improved here?
> 
> Right, the range discussion is a tangent and applies to all YUV
> formats, so it's not a new question.
> 
> > My understanding is that the Y-only pixel formats behave in a well 
> > defined way (or, as well defined as the YUV formats), and there's 
> > nothing more to add here. Is that right?
> 
> There are two things:
> 
> - Y8 follows COLOR_RANGE property, just like all other YUV formats.
> - Y8 implies that Cb and Cr are both neutral (0.0 in nominal values).
> 
> I'd like these explicitly written down, so that they become obvious to
> everyone. I suspect either one might be easy to forget when writing
> code and taking shortcuts without thinking.
> 
> 
> Laurent,
> 
> I did find a case where (Y', neutral, neutral) does *not* seem to expand
> to RGB=(Y, Y, Y): ICtCp. The conversion from ICtCp to L'M'S' does
> produce (Y', Y', Y'), but the LMS-to-RGB matrix scrambles it.
> 
> I didn't dig through BT.2020 constant-luminance Y'C'bcC'rc, but I
> wouldn't be surprised if it scrambled too.
> 
> Of course, both of the above are not just one matrix. They require two
> matrices and the transfer characteristic each to compute. KMS color
> operations cannot implement those today, but with the colorop pipelines
> they will if the hardware does it.
> 
> That's why I think it's important to document the assumption of Cb and
> Cr when not part of the pixel format, and not write down a specific
> expansion to RGB like (Y, Y, Y).

Every time I discuss color spaces, the scopes of "RGB" and "YUV" seem to
expand more and more. This makes me wonder how we define those two
concepts. Taking the conversion from RGB to ICtCp as an example, would
you consider LMS and L'M'S' as "RGB" formats, and ICtCp as a "YUV"
format ?

-- 
Regards,

Laurent Pinchart
