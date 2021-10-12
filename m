Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE2F42A5B0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 15:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9059289DFC;
	Tue, 12 Oct 2021 13:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410AB89DFC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 13:27:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id g25so20487377wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yuAFR7oMHRERVT1WGTjSkKtVpWlYtL7mEybz0eaEJQw=;
 b=YWgpR0MZYC7zaEcbKQlIoGR8mr+wX6ADq20a1X7bm05FQL8idhvBujWscs0dVE/f0Q
 BbPMcOzpfBEAa+tsTFNb9HdWppnUKjgUyyBnzF3Y+dplyItf0wSyoTAYQmUp5kLHWYAK
 GMvuPyoRT8nT23pb+sYrGXUDbQAO5HRbtkKrTDbvY3W97eNbUtMNknOM4dhf3VzY1x37
 9DDXuC9YmLK8nb9WusYGlu1NaAUtwO+AYvQ8982XhjzqH/9k6/5KxzPSeTuQ0mPLiTIw
 65Dojhc+OfqNmxpB42ewuT/so6thSrpHV+FXcrGmwWjKmfwUKWsVOyI4vOfGq1nF8OvV
 5NQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yuAFR7oMHRERVT1WGTjSkKtVpWlYtL7mEybz0eaEJQw=;
 b=2Ra/d9MAnw9tOohmHN2s5vau4+SVW4NQHmT4ZNHfnIJn9ncyvhpAzolkBX/31HT/Ya
 jhSHO88w2uG9GHYQJMtntjLsT4oDnl2A3P4G+Ei0uEOwuNan4xc65OiFBdU7KU32Exih
 tnU0FUhWaAJHKymhDkUe/avtJ3qRdIlPT5waK9Rys5XNwekWcS+g3OMuqx4/typN8+Hl
 VQO5SGIudFCuGeE4DRcJThFvSepcdL5XCldE3F983ZVxv4Pwu5tBZ7I2SkRaz8ZvtRDV
 UEoug1KOkzs2BReN8sqRApnfUBZkoy1FZTGQ0TaC/4wKjzHjmM/5xrzVwQlhTwpjCjNx
 cEDQ==
X-Gm-Message-State: AOAM533Lbga+aSnzKKEJt1B15GMM+sobLIeN2HabrdWo/rNVBpBkcEnj
 4bMiZhnL9u7IMOxWYZLS5gUGSw==
X-Google-Smtp-Source: ABdhPJxyMFv4LLCVKv9M3X6ZNauRpw5RZnr8yVPSg7Qb/W5sbaSAUD1op7cDnt+nL/nsEaD5mL2hsg==
X-Received: by 2002:a05:600c:4f92:: with SMTP id
 n18mr5670479wmq.22.1634045277651; 
 Tue, 12 Oct 2021 06:27:57 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c?
 ([2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c])
 by smtp.gmail.com with ESMTPSA id z1sm1499817wrt.94.2021.10.12.06.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 06:27:57 -0700 (PDT)
Subject: Re: [PATCH v5 0/8] drm/omap: Add virtual-planes support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <e7c295be-7a0c-877c-ba25-3b580d7d9521@ideasonboard.com>
 <a4e72823-6e92-cce1-0607-5506ddda42fa@baylibre.com>
 <99c11b0b-eab8-a7b9-8aab-8cc06be14cd5@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e5c37525-b150-2a8f-25f8-c3db3e249bf2@baylibre.com>
Date: Tue, 12 Oct 2021 15:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <99c11b0b-eab8-a7b9-8aab-8cc06be14cd5@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi,

On 12/10/2021 12:36, Tomi Valkeinen wrote:
> On 12/10/2021 11:30, Neil Armstrong wrote:
>> On 12/10/2021 09:15, Tomi Valkeinen wrote:
>>> On 23/09/2021 10:06, Neil Armstrong wrote:
>>>> This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].
>>>>
>>>> This patch series adds virtual-plane support to omapdrm driver to allow the use
>>>> of display wider than 2048 pixels.
>>>>
>>>> In order to do so we introduce the concept of hw_overlay which can then be
>>>> dynamically allocated to a plane. When the requested output width exceed what
>>>> be supported by one overlay a second is then allocated if possible to handle
>>>> display wider then 2048.
>>>>
>>>> This series replaces an earlier series which was DT based and using statically
>>>> allocated resources.
>>>>
>>>> This implementation is inspired from the work done in msm/disp/mdp5
>>>> driver.
>>>>
>>>> Changes since v4 at [1]:
>>>> - rebased on v5.15-rc2
>>>
>>> What is this based on? Doesn't apply to v5.15-rc2, and "error: sha1 information is lacking or useless".
>>
>> Indeed the sha1 info is useless, it's based on v5.15-rc2 on top of "HACK: drm/omap: increase DSS5 max tv pclk to 192MHz"
>> in order to validate on 2k monitors.
> 
> I'm personally fine with removing the HACK from that, and applying it too. I used the patch for a long time without any issues. However, I never found anyone to confirm that 192MHz is fine (or that it's not fine). Too old HW for finding HW engineers to look at it =).

Indeed it seems to be applied the TI trees for a long time now, will post it.

Thanks,
Neil

> 
>  Tomi

