Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE144B7A3B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 23:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394EF10E58B;
	Tue, 15 Feb 2022 22:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B160510E592
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 22:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644963016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lpQF/1aozwPXUYPuIRUCyzJVUaZkY7i5LfgQfbgp/4=;
 b=Xw8m5WqnW3PFmVF1QbQu/dqc29BqE40TEK64PM6f/Hk7af1IhOc+vAp/4XykZ0nDuohgm7
 V8fNDuKc8AR0JSSAsIzowwDDM/p1tepFmWjkJZ+4ez+UFll8Xleefn1HpKyC1/yPzhY39O
 MAy7wuCvz3eftGnkw61/exVJjBfLhpM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-V92xWW06OtK-MmtKWNJvQw-1; Tue, 15 Feb 2022 17:10:15 -0500
X-MC-Unique: V92xWW06OtK-MmtKWNJvQw-1
Received: by mail-wr1-f71.google.com with SMTP id
 m8-20020adfa3c8000000b001e3381fdf45so108982wrb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 14:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/lpQF/1aozwPXUYPuIRUCyzJVUaZkY7i5LfgQfbgp/4=;
 b=rQkJweYwo8XSbLVw8mvprXXJE4JnN36I4TvfhU1b0bgTmlN32OVGMsnemNJfGR5ecW
 DnFw0XsbRbVecbsrMOSgyzK9Zqs49NDF+eIPHAZ+CU41sjwN8eVtpEDiNC36MMLvzGt0
 CbUN6dIdrCA2Ba3utilWzUB26GXoMvAtXdBLcJKvY3Chr5rb6T6+EjoObJk91Jx0zGFV
 gMgRRDe+4SCAKZ4DJcBHUb8AmoMowWKSHULQIWbxgHMRafkZZ6n9BPNbt3yPdcZQpF4F
 fN+vpYYX6n8aZQ6NaWYJHz2+SMHh/iipInomVNw+HElBLNb2ShcFLxgVa4AIgMExJt3z
 UIpw==
X-Gm-Message-State: AOAM5324bzEoG1gHJlKecIjuA7b+Tl/q/SHq5N7n2S6modVkGAfYBQHs
 S2AoF39WhPP7qf/x0MGuuiucCM0TguqRyL1TlgQ3rvfbRwwIywaxZJFszv9XRnzcz1hJCy6ISVf
 6NtHQo8yrIEmByww4eGFJ4+MTCbS8
X-Received: by 2002:a7b:ce84:0:b0:37c:52fe:a3ff with SMTP id
 q4-20020a7bce84000000b0037c52fea3ffmr2504358wmj.48.1644963014379; 
 Tue, 15 Feb 2022 14:10:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5t5oT/WGZxlEhtAFFuNjdgRZmbAJp74nksVLboadzTM50qN6VJ2Ad4Sqri3UYJkxSujekWQ==
X-Received: by 2002:a7b:ce84:0:b0:37c:52fe:a3ff with SMTP id
 q4-20020a7bce84000000b0037c52fea3ffmr2504351wmj.48.1644963014221; 
 Tue, 15 Feb 2022 14:10:14 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id 12sm8773502wry.111.2022.02.15.14.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 14:10:13 -0800 (PST)
Message-ID: <d875e70c-e9a9-9e4d-7041-f8ff6ee48f4f@redhat.com>
Date: Tue, 15 Feb 2022 23:10:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] drm/panel-edp: Allow querying the detected panel
 via debugfs
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220205001342.3155839-1-dianders@chromium.org>
 <20220204161245.v2.3.I209d72bcc571e1d7d6b793db71bf15c9c0fc9292@changeid>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220204161245.v2.3.I209d72bcc571e1d7d6b793db71bf15c9c0fc9292@changeid>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, Thierry Reding <thierry.reding@gmail.com>,
 jjsu@chromium.org, lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/5/22 01:13, Douglas Anderson wrote:
> Recently we added generic "edp-panel"s probed by EDID. To support
> panels in this way we look at the panel ID in the EDID and look up the
> panel in a table that has power sequence timings. If we find a panel
> that's not in the table we will still attempt to use it but we'll use
> conservative timings. While it's likely that these conservative
> timings will work for most nearly all panels, the performance of
> turning the panel off and on suffers.
> 
> We'd like to be able to reliably detect the case that we're using the
> hardcoded timings without relying on parsing dmesg. This allows us to
> implement tests that ensure that no devices get shipped that are
> relying on the conservative timings.
> 
> Let's add a new debugfs entry to panel devices. It will have one of:
> * UNKNOWN - We tried to detect a panel but it wasn't in our table.
> * HARDCODED - We're not using generic "edp-panel" probed by EDID.
> * A panel name - This is the name of the panel from our table.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

