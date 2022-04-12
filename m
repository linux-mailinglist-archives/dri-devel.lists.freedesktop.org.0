Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B364FD328
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB8D10FB97;
	Tue, 12 Apr 2022 08:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC12C10EA07
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:59:05 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso20164157fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=61Zhp6cmoUliim9YwiwcZpLzWn635tX3xmuezZ/XE1Q=;
 b=i+E8+24eJSPuwFpWwnhwRcMosCQtTEQoU0qVumPFd1B/5vOrb43OnnM06scRAF73Yq
 oMByED8vyfj7h/juyKz0L3ed4WqHpCgSlskOcx+kVCwtlWgCiSRQA57g1AuGyhRftLkn
 PMcblX+TbX+MHeKj3cpATLc7zfvBTrR1JonUwOgFtW9kUMKobrEyLRFKbEi6WgtAtS6n
 FCB8ilN1nAxUZedW0P+Azc/J+6dpMpBO/s4qN2MMBBKOQNBC+cNRVDAa2Xi5cUNXXxIm
 UJfzvicRT62Wq64zodMNVExN+Gzy0MnFtlZGEVwjmhUqQKDk5bd3GuHqulcLVnv1AYsL
 SMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=61Zhp6cmoUliim9YwiwcZpLzWn635tX3xmuezZ/XE1Q=;
 b=J2HM97opxdISBShJN1HPtYxUZRCH2nMaqrl5mUVgAqnWz0/mfUg0aRk9KO7b85BdOU
 FmsZaCqnNDdfVTSSR00gazuNJZP391yEcC0+QEDljQgHwRSbP3HiWh13aR+cA+5Ebx3l
 g/EE4RAED9OPuUBaXU4fDe9bAsfzuZihOlCQVEjqIo32z6S7f6w0Zz9lhsN/jdljv+wK
 gGZF2S0qQ4VEis1zeInU1Ik/A5nT0OaYTB9YZvxTGml4LvVudpUkU1N3YFjcxHlYqUNZ
 cF/B/DWZEj04P/xQ8YoQgo/vRAAIf0dhhzNzXDfpoZ2EoPW+UgJFX/sYWvb+RRrc8kxY
 hiwA==
X-Gm-Message-State: AOAM530PDkWVYUbV3yYPgz2PAtO2E9YhHnXYlqH0y9ssAOktFUrs+iU8
 Iv6wFhvIOABR0dgDoipo68ZiJuhQgOBOIJ/QNFl1JA==
X-Google-Smtp-Source: ABdhPJzgcHEvPZCp6gdbg7kDhJKlxditkMSAtxr85wga0tldVXhcDC3GVMdHj7CuZ6MWQrtRrZ1EySnMvRiS1vE8OqA=
X-Received: by 2002:a05:6870:f21a:b0:dd:9bec:caf8 with SMTP id
 t26-20020a056870f21a00b000dd9beccaf8mr1592268oao.78.1649753944968; Tue, 12
 Apr 2022 01:59:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 01:59:04 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-7-granquet@baylibre.com>
 <33212024-ae93-32c3-7890-09006057ff49@collabora.com>
In-Reply-To: <33212024-ae93-32c3-7890-09006057ff49@collabora.com>
MIME-Version: 1.0
Date: Tue, 12 Apr 2022 01:59:04 -0700
Message-ID: <CABnWg9sckU58Ga-qUgd+pk2M75H4=XZyAyP69e5QJP0+dvsusg@mail.gmail.com>
Subject: Re: [PATCH v9 06/22] video/hdmi: Add audio_infoframe packing for DP
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 vkoul@kernel.org, 
 airlied@linux.ie, chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, 
 ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, 
 kishon@ti.com, krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de, 
 robh+dt@kernel.org, tzimmermann@suse.de
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022 10:09, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>
>> Similar to HDMI, DP uses audio infoframes as well which are structured
>> very similar to the HDMI ones.
>>
>> This patch adds a helper function to pack the HDMI audio infoframe for
>> DP, called hdmi_audio_infoframe_pack_for_dp().
>> hdmi_audio_infoframe_pack_only() is split into two parts. One of them
>> packs the payload only and can be used for HDMI and DP.
>>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>   drivers/video/hdmi.c           | 82 ++++++++++++++++++++++++++--------
>>   include/drm/dp/drm_dp_helper.h |  2 +
>>   include/linux/hdmi.h           |  7 ++-
>>   3 files changed, 71 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
>> index 947be761dfa4..5f50237554ed 100644
>> --- a/drivers/video/hdmi.c
>> +++ b/drivers/video/hdmi.c
>> @@ -21,6 +21,7 @@
>>    * DEALINGS IN THE SOFTWARE.
>>    */
>>
>> +#include <drm/dp/drm_dp_helper.h>
>>   #include <linux/bitops.h>
>>   #include <linux/bug.h>
>>   #include <linux/errno.h>
>> @@ -381,12 +382,34 @@ static int hdmi_audio_infoframe_check_only(const struct hdmi_audio_infoframe *fr
>>    *
>>    * Returns 0 on success or a negative error code on failure.
>>    */
>> -int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
>> +int hdmi_audio_infoframe_check(const struct hdmi_audio_infoframe *frame)
>
>I agree with this change, as hdmi_audio_infoframe_check_only()'s param is a const,
>but you really should mention that you're constifying this one in your commit
>description, or do that in a separate commit.
>
>Either of the two is fine.
>
>Regards,
>Angelo

Noted, I'll add it to the commit message.

Thx,
Guillaume.
