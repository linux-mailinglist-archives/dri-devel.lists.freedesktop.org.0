Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA117716D7
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 23:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ACB10E190;
	Sun,  6 Aug 2023 21:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA80B10E731
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:49:34 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-63cf4827630so12723736d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20221208.gappssmtp.com; s=20221208; t=1691164174; x=1691768974;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nc76YnTwPgAoVYIjVt7VEqf3H+jooR3FLBPpdziZ4Jw=;
 b=I/a1775xZvZmGkMzLjOsn/YWIVsCv/Z2uO8H/h+WliUhMgz08j8hrG8s/ZvxMTYuu7
 2s3SGaaa6dUVUfFg5jpLxXDnVUbnfLhUqu96fVMbNLMtumByKPpgLZQUprKHFWNKsV2w
 xeTR9cCmzWRWI5Gw1BfOpV5tSN+Tz+R6k8zWSzKk+/HsL6dAeUnHYVilvg3PpSelzifV
 3z979SFDdU4uUxwAqUbmacuMlvoFV2Ohx7YagsiM0usIUFW3ejU1Zd4OfbtCsfuK6m6u
 YdSiZYUyPCbkzlpZB7fzqqen6i9iGan9xV5+VkTD6P/HW3qerXb4E0BrmHc6Bsth5j/8
 2Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691164174; x=1691768974;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nc76YnTwPgAoVYIjVt7VEqf3H+jooR3FLBPpdziZ4Jw=;
 b=H9eJQ2CMIkTi/RCjhpHGgeK1fUgWPPkoxt1wxxICHKZ7WNi6bVdApG8FujwAXwHr8F
 w7RROFJKwPfZc5to8+YpRy99+tzTeVBnIa/RZ2DqQ092T6tZSHw3y1wu+8VjEBo6/JQF
 +GJZXEHyZ30SLVBY5KO+w1Lt+a3JbMg3SbnrJoflX1ZqiuQjHJ6fbRsEzUHPma6WU28A
 3+meR0VCWmMFmMLVuA74aXOOw7emCK43xCyirLfjYv7p2RA9NNLKgeM8Mtdh7F4aP70Q
 EJq88mgCcV51K9c/2j8roW+xJDJ3FdvmdbuVZ9UbDLYMeJvwYdJLUeBAwmQ4YmiU77vc
 SOBA==
X-Gm-Message-State: AOJu0YzHsFuha17fEJROK5OeJzjNthZlKmb1ehAdvbHWdoG99kY0AmVn
 8mMBjF6mfEEU1Ln+QdGyFjXM3Q==
X-Google-Smtp-Source: AGHT+IGGdOpnWgSnKj+s3cetUBVrgvG7bH8Rpmt8mJEyqbz5bn4hIDmbwzrHyLGFa67jWuB6elEM+w==
X-Received: by 2002:a0c:de13:0:b0:634:20f:471c with SMTP id
 t19-20020a0cde13000000b00634020f471cmr1365092qvk.14.1691164173740; 
 Fri, 04 Aug 2023 08:49:33 -0700 (PDT)
Received: from [192.168.68.66] (69-165-247-94.cable.teksavvy.com.
 [69.165.247.94]) by smtp.gmail.com with ESMTPSA id
 l7-20020a0ce507000000b0063d2ea55018sm748271qvm.125.2023.08.04.08.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Aug 2023 08:49:32 -0700 (PDT)
Message-ID: <bf2001af-00f2-3a1e-8b79-5747e6607a12@igel.co.jp>
Date: Fri, 4 Aug 2023 11:49:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] drm: rcar-du: Add more formats to
 DRM_MODE_BLEND_PIXEL_NONE support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230728200714.2084223-1-dhobsong@igel.co.jp>
 <20230803234703.GJ9722@pendragon.ideasonboard.com>
 <20230803235315.GL9722@pendragon.ideasonboard.com>
 <20230804000615.GN9722@pendragon.ideasonboard.com>
Content-Language: en-US
From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
In-Reply-To: <20230804000615.GN9722@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 06 Aug 2023 21:43:47 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 taki@igel.co.jp, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thank you for the review.

On 2023/08/03 20:06, Laurent Pinchart wrote:
> On Fri, Aug 04, 2023 at 02:53:17AM +0300, Laurent Pinchart wrote:
>> On Fri, Aug 04, 2023 at 02:47:04AM +0300, Laurent Pinchart wrote:
>>> Hi Damian,
>>>
>>> Thank you for the patch.
>>>
>>> On Fri, Jul 28, 2023 at 04:07:13PM -0400, Damian Hobson-Garcia wrote:
>>>> Add additional pixel formats for which blending is disabling when
>>> Did you mean "disabled" instead of "disabling" ?


Oops.  Yes, that's exactly what I meant.


>>>
>>>> DRM_MODE_BLEND_PIXEL_NONE is set.
>>>>
>>>> Refactor the fourcc selection into a separate function to handle the
>>>> increased number of formats.
>>>>
>>>> Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
>>>> ---
>>>>   drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 49 ++++++++++++-------
>>>>   1 file changed, 32 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
>>>> index 45c05d0ffc70..96241c03b60f 100644
>>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
>>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
>>>> @@ -176,6 +176,37 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
>>>>   	DRM_FORMAT_Y212,
>>>>   };
>>>>   
>>>> +static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
>>>> +{
>>>> +	u32 fourcc = state->format->fourcc;
>>>> +
>>>> +	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
>>>> +		switch (fourcc) {
>>>> +		case DRM_FORMAT_ARGB1555:
>>>> +			fourcc = DRM_FORMAT_XRGB1555;
>>>> +			break;
>>>> +
>>>> +		case DRM_FORMAT_ARGB4444:
>>>> +			fourcc = DRM_FORMAT_XRGB4444;
>>>> +			break;
>>>> +
>>>> +		case DRM_FORMAT_ARGB8888:
>>>> +			fourcc = DRM_FORMAT_XRGB8888;
>>>> +			break;
>>>> +
>>>> +		case DRM_FORMAT_BGRA8888:
>>>> +			fourcc = DRM_FORMAT_BGRX8888;
>>>> +			break;
>>>> +
>>>> +		case DRM_FORMAT_RGBA1010102:
>>>> +			fourcc = DRM_FORMAT_RGBX1010102;
>>>> +			break;
>>> Should DRM_FORMAT_ARGB2101010 be added as well, or did you leave it out
>>> intentionally ?

Yes, it was intentionally left out for the time being for the
reason that you noted (i.e. DRM_FORMAT_XRGB2101010 not
being handled by the DU driver).

>> It looks like DRM_FORMAT_ARGB2101010 will require a bit more work, as
>> DRM_FORMAT_XRGB2101010 is not handled by the DU driver at the moment.
>> Let's do so with a patch on top of this series.
Yes, I was thinking the same thing.
> Replying to myself again, the datasheet doesn't explicitly list
> DRM_FORMAT_XRGB2101010 as supported, but the generic mechanism to
> specify the location of the components should work fine for that format.
> Is this something you would be able to test ?

Unfortunately I don't have a Gen 4 system on hand to test the 2-10-10-10 
formats with.
I will double-check with the office in Japan, but I don't think that 
they have one either.

>
>> There's no need to send
>> a v2, I can handle the simple change in the commit message if you let me
>> know whether my comment is right or wrong.


Thank you,
Damian

