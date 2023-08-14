Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57EF77BE28
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 18:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256E910E087;
	Mon, 14 Aug 2023 16:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F3610E085
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 16:27:38 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a5ad44dc5aso3868802b6e.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20221208.gappssmtp.com; s=20221208; t=1692030458; x=1692635258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qnJ0ZfY7u/gXkrzwVapX3Ay2G8CLjKdQBzM1RBGM0BQ=;
 b=UQQDzxaHGhsKMiWZPPE8BPDYp67wsSvrpMGTflKv3HEGQOle7nl7ezFKqMj6hQmX+c
 vADQRxxlUq1EZuqpG4Mi5jzuiApsa8mTqj5czjVShtf3eVEK0tI5n52Uakl5F5QIV5lK
 k4XZfc+ztqoL5kzoxI7FXX0o/rNsElVrtRCYjod1gV3eqr7u36eMiQVrezmqWD6Ayloj
 jIc7jiZMfgYeVAOz8Ef1vz4N1XNXkCYAgjw/l0XtqFqmWzKTfwpyVELnIJS38Og7neq9
 xkW9m7yFWTwxkTQbgGpcqLtHnD2EPSVn2SLd4ZPzHHE2JrGyooNz77XA23D15Ttlr1Jz
 D1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692030458; x=1692635258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qnJ0ZfY7u/gXkrzwVapX3Ay2G8CLjKdQBzM1RBGM0BQ=;
 b=VVltXi1d5sT9B5HxeySvPY2diIXRPN9WZvE6qZorBxXZlb22gRNUyYzNDxEKaN4xXt
 RaGiiL6ehE1yzKfxCZ/D/2segpESvw5UOf9S7b3VfLdD+Rq5GPrDTatsXwjqs0vkZNqy
 p/1spe/PX4iV7hgPmdARDhfPLja7QUb4C88H13otH7m+7sp8JxpohMT+B4PaQBC7CVud
 jvg+KSuZ6BotXe3OOmJcUT23rZ3d+XV4mm+X5qviHZ1K1OvpT47u5ZDBfGA45smXbPxj
 4e7sSsain6dKcy0yRXMTIsT57FScJIIZaA4OsdNMVfUt957fprZVj8EsW+c9BCn6p0WE
 ptHA==
X-Gm-Message-State: AOJu0YwdZsK4ojPQ6ibny5pS8rtkvxwUkdmDnGDIuu82uchQtIQ4Vaz6
 S1HhaTeQdc99YkbXbBwWrHF5UX3VCZxJIsfeaFA=
X-Google-Smtp-Source: AGHT+IGN+ncCNSUGt4HpvzhXjUkm63Eh7Se1W+uHEqnDbW3D5dUgLyYrM4FddwdZOSP1etM7pSbv7w==
X-Received: by 2002:a05:6358:9188:b0:133:4ce:4e8c with SMTP id
 j8-20020a056358918800b0013304ce4e8cmr5843777rwa.29.1692030457876; 
 Mon, 14 Aug 2023 09:27:37 -0700 (PDT)
Received: from [192.168.68.66] (69-165-247-94.cable.teksavvy.com.
 [69.165.247.94]) by smtp.gmail.com with ESMTPSA id
 g2-20020ac84b62000000b00403c1a19a2bsm3173601qts.92.2023.08.14.09.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 09:27:37 -0700 (PDT)
Message-ID: <25a7fd96-d0a4-2d7f-dcc5-50abd048c6f4@igel.co.jp>
Date: Mon, 14 Aug 2023 12:27:35 -0400
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
 <bf2001af-00f2-3a1e-8b79-5747e6607a12@igel.co.jp>
 <20230804155249.GJ12951@pendragon.ideasonboard.com>
 <20230814104655.GB5723@pendragon.ideasonboard.com>
Content-Language: en-US
From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
In-Reply-To: <20230814104655.GB5723@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Aug 2023 16:34:37 +0000
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
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 kieran.bingham+renesas@ideasonboard.com, taki@igel.co.jp,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,


On 2023/08/14 6:46, Laurent Pinchart wrote:
> On Fri, Aug 04, 2023 at 06:52:51PM +0300, Laurent Pinchart wrote:
>> On Fri, Aug 04, 2023 at 11:49:32AM -0400, Damian Hobson-Garcia wrote:
>>> On 2023/08/03 20:06, Laurent Pinchart wrote:
>>>> On Fri, Aug 04, 2023 at 02:53:17AM +0300, Laurent Pinchart wrote:
>>>>> On Fri, Aug 04, 2023 at 02:47:04AM +0300, Laurent Pinchart wrote:
>>>>>> On Fri, Jul 28, 2023 at 04:07:13PM -0400, Damian Hobson-Garcia wrote:
>>>>>>> Add additional pixel formats for which blending is disabling when
>>>>>> Did you mean "disabled" instead of "disabling" ?
>>> Oops.  Yes, that's exactly what I meant.
> I'll fix this locally.


Thank you very much.


>
>>>>>>> DRM_MODE_BLEND_PIXEL_NONE is set.
>>>>>>>
>>>>>>> Refactor the fourcc selection into a separate function to handle the
>>>>>>> increased number of formats.
>>>>>>>
>>>>>>> Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 49 ++++++++++++-------
>>>>>>>    1 file changed, 32 insertions(+), 17 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
>>>>>>> index 45c05d0ffc70..96241c03b60f 100644
>>>>>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
>>>>>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
>>>>>>> @@ -176,6 +176,37 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
>>>>>>>    	DRM_FORMAT_Y212,
>>>>>>>    };
>>>>>>>    
>>>>>>> +static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
>>>>>>> +{
>>>>>>> +	u32 fourcc = state->format->fourcc;
>>>>>>> +
>>>>>>> +	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
>>>>>>> +		switch (fourcc) {
>>>>>>> +		case DRM_FORMAT_ARGB1555:
>>>>>>> +			fourcc = DRM_FORMAT_XRGB1555;
>>>>>>> +			break;
>>>>>>> +
>>>>>>> +		case DRM_FORMAT_ARGB4444:
>>>>>>> +			fourcc = DRM_FORMAT_XRGB4444;
>>>>>>> +			break;
>>>>>>> +
>>>>>>> +		case DRM_FORMAT_ARGB8888:
>>>>>>> +			fourcc = DRM_FORMAT_XRGB8888;
>>>>>>> +			break;
>>>>>>> +
>>>>>>> +		case DRM_FORMAT_BGRA8888:
>>>>>>> +			fourcc = DRM_FORMAT_BGRX8888;
>>>>>>> +			break;
>>>>>>> +
>>>>>>> +		case DRM_FORMAT_RGBA1010102:
>>>>>>> +			fourcc = DRM_FORMAT_RGBX1010102;
>>>>>>> +			break;
>>>>>> Should DRM_FORMAT_ARGB2101010 be added as well, or did you leave it out
>>>>>> intentionally ?
>>> Yes, it was intentionally left out for the time being for the
>>> reason that you noted (i.e. DRM_FORMAT_XRGB2101010 not
>>> being handled by the DU driver).
>>>
>>>>> It looks like DRM_FORMAT_ARGB2101010 will require a bit more work, as
>>>>> DRM_FORMAT_XRGB2101010 is not handled by the DU driver at the moment.
>>>>> Let's do so with a patch on top of this series.
>>> Yes, I was thinking the same thing.
>>>
>>>> Replying to myself again, the datasheet doesn't explicitly list
>>>> DRM_FORMAT_XRGB2101010 as supported, but the generic mechanism to
>>>> specify the location of the components should work fine for that format.
>>>> Is this something you would be able to test ?
>>> Unfortunately I don't have a Gen 4 system on hand to test the 2-10-10-10
>>> formats with.
>>> I will double-check with the office in Japan, but I don't think that
>>> they have one either.
>> Tomi, is this something you could test ?
> Replying to myself, this is something we could test, but let's not delay
> this series, new formats can always be added on top.

Ok, great.  Thanks very much.


Damian

>>>>> There's no need to send
>>>>> a v2, I can handle the simple change in the commit message if you let me
>>>>> know whether my comment is right or wrong.
