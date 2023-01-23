Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F956775F5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 09:00:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76F710E1D7;
	Mon, 23 Jan 2023 08:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE7410E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 08:00:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DE05BB80CA1;
 Mon, 23 Jan 2023 08:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF39C433EF;
 Mon, 23 Jan 2023 08:00:40 +0000 (UTC)
Message-ID: <b1c023b6-171a-fa19-de60-99ab943072a8@xs4all.nl>
Date: Mon, 23 Jan 2023 09:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/vc4: hdmi: make CEC adapter name unique
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <dcf1db75-d9cc-62cc-fa12-baf1b2b3bf31@xs4all.nl>
 <20230120191344.xldhudsmb4xar4u3@houat>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230120191344.xldhudsmb4xar4u3@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2023 20:13, Maxime Ripard wrote:
> Hi Hans,
> 
> On Thu, Jan 19, 2023 at 10:02:19AM +0100, Hans Verkuil wrote:
>> The bcm2711 has two HDMI outputs, each with their own CEC adapter.
>> The CEC adapter name has to be unique, but it is currently
>> hardcoded to "vc4" for both outputs. Change this to use the card_name
>> from the variant information in order to make the adapter name unique.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> The patch looks good but should we Cc stable and add a Fixes tag here?

Good idea:

Fixes: 15b4511a4af6 ("drm/vc4: add HDMI CEC support")

Regards,

	Hans
