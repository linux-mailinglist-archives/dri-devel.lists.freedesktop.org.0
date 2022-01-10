Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF88489586
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 10:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F01012B570;
	Mon, 10 Jan 2022 09:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C150712B571
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 09:46:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l25so14715523wrb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+abZjbadrthkxAndrqLQ/y+060FFMnMwVyalc3ssY1Y=;
 b=sO2E/PaXEhSg08nvq/BCgxO8/eqxz7kYQykOe29ZAMGqlz4RjZiVUTmKtkK4J+qI6B
 FHSGBoGhMWSscRNeJOBxhZXeQhcZ6InnvUpjexCThxUsMuG2bYJfqoh84D0VfH+pxv0F
 TQsxMrKdSyMTSok4d+LNJ2ki7L6oJ4cCQcdb9ZnNqa3m0g4plEsiLJkHZB+uXtOX2/ep
 0b0X/KT4oa9N/SstNfh5gD8g7Da74iLwCk2nxP3+RdIK3cQRbMJTjiiZNthu6yIT7VCM
 qoZ23WmUA6bTE75sPMRidBuaPMUS8NEMoasXzRkI+vktnP0TwK8SyKZjKJALt2slE8Y9
 yovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+abZjbadrthkxAndrqLQ/y+060FFMnMwVyalc3ssY1Y=;
 b=6xzdSCTmS25L2/5Ct0SZePkVfAhanzL6KP/bXiVdAfIFgR7FnMy41V4wWhVn4uW851
 Evw5nOswN0BllW3HC1wbNbS0p/syu77PoCAy/hnfhx1zIlqvSEj16xJorGRkqPkRqG2H
 rNmMgSHHnhkRIKwyK9Jrdq/A+ef3zs3PmaVT7cRiK1ILNxm/ZEmjwfA4YbGzYYX6pz4B
 wFwikdIc1lglUyDAP1W5sstqUL/T3KFD9p+b/kyf0hRu6XqZEkOi3hp8Rj/BwNcGU0j7
 F7vVr/QPN090E5uEslYC3nxeLgVKRwFv8HvlrFzk3WMCkROfFZilmVYOpwOybdUBWBG5
 /MUA==
X-Gm-Message-State: AOAM530OEkhjCpkCe9pK03+0MvBYjVrgWYGo0FM7H132nOOdcigobUF/
 DkDwFwIcqH/79WGb7uT4yYDKmw==
X-Google-Smtp-Source: ABdhPJz1VFZkwqr2BXYdj3OFdBaCpkLg0P2ezfDFiTjGjOlfKUP0TggZS0l0V/6zvUk0jNJegfFt3A==
X-Received: by 2002:adf:fc0f:: with SMTP id i15mr5742743wrr.467.1641807977299; 
 Mon, 10 Jan 2022 01:46:17 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1?
 ([2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1])
 by smtp.gmail.com with ESMTPSA id u14sm6078840wrf.39.2022.01.10.01.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:46:16 -0800 (PST)
Subject: Re: [PATCH 5/6] drm/meson: add DSI encoder
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-6-narmstrong@baylibre.com>
 <CAFBinCCR4zftkvJWgX4T068BRsjVp9YhRbzgdBOR+tuMcGSZ3w@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b0200846-0346-a65b-ed98-c0c778040cd9@baylibre.com>
Date: Mon, 10 Jan 2022 10:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCCR4zftkvJWgX4T068BRsjVp9YhRbzgdBOR+tuMcGSZ3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/01/2022 23:35, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Fri, Jan 7, 2022 at 3:57 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
> [...]
>> +       writel_bits_relaxed(BIT(3), BIT(3), priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
> see my comment on patch #3 from this series for BIT(3)
> 

Yep, thanks,

Neil

> 
> Best regards,
> Martin
> 

