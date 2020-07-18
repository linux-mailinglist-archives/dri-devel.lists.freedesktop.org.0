Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F82248F1
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 07:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9CB6E136;
	Sat, 18 Jul 2020 05:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7642A6E136
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 05:18:48 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x8so6280491plm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 22:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=mlfozsoeSwNR4jerQErJFdBhmV0KjCymWwxCPubYIaA=;
 b=bJyEKfCPgI1GtaOteGEWzVV0x2CRPEvQOeStpeHpBoUvnK5R1hBYenSXTnShj2gVan
 OAXaYHXKzDkwWwjJOkHUgLZdLYhgODNAzKKdMyIGUVeIclj/VI8CJrz6eaaCu3Zg/DUo
 0e/3AjCnrMhq3VO9xYbstzE7ObX8S6F4gNdl3QDOSh2Z9yhNqKsFhsj1Lawte6q1wWKQ
 aqaQcRcLaJYqekfnfpOObfFk+8HM+8YO0Si2qq5f1MFV9K1JG+aGHVOlHvVswUr8ZZkF
 PJ9j4RxFQMWmeYdJLsZ4xL/+//mski0uxYNP+E9v9KbOn17EVmHrUBlEXqx1rd4PHUAA
 SdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=mlfozsoeSwNR4jerQErJFdBhmV0KjCymWwxCPubYIaA=;
 b=MZDavNm9mHh5+jOhVYxz3P7KhQZK6fVV24fPo2Cp1zt6YH69IpTj/5sD7h/HEA2ww4
 45SYrnjdd7ZQwrMzOy3+NJnMQ5aA51mTNOtCCQ+zWLOyqdzq/eK1SaEWdqDQG1yAEWBz
 8x/g0ZDLM8Y9aZ2wt2EQw/imwV6IOImoOPguO6RqGRw369ozWazWdsV+auX+/FnAjEuF
 hGFrWACRZGJYA3SwweqliORhsxvGsHgwg08nireaDT51C+4epf2Ve7p7CYfYD/zlf+XL
 ACE4Cog5ZIlax7CpqrBtHtx/50OncloV4Hy/ygZ26lCgWRTaEJA5m559bUndDuLIS0cK
 6pVQ==
X-Gm-Message-State: AOAM530PvpiBp0NHAm8Oi3Rj4CiMzyvlWfmjwqw+NGl3XP0SD0eZkl+5
 0/0I5IFpLzyyMGC4EmQ/r24=
X-Google-Smtp-Source: ABdhPJx+qV5tP7OduXb9qq/p372Wy7fK9H763iy8HSM4aIsKs/6vD63FNgE7DS+Nru7djfo1eoK6XA==
X-Received: by 2002:a17:902:d704:: with SMTP id
 w4mr10626957ply.278.1595049527861; 
 Fri, 17 Jul 2020 22:18:47 -0700 (PDT)
Received: from SL2P216MB0105.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:22::5])
 by smtp.gmail.com with ESMTPSA id
 137sm9381988pgg.72.2020.07.17.22.18.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jul 2020 22:18:46 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Lee Jones <lee.jones@linaro.org>, Daniel
 Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v4 05/20] backlight: improve backlight_device documentation
Thread-Topic: [PATCH v4 05/20] backlight: improve backlight_device
 documentation
Thread-Index: AQHWUWo8LdMENsI4A0SJ70NDIxdujKkM4vEa
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Sat, 18 Jul 2020 05:18:39 +0000
Message-ID: <SL2P216MB0105B428FFAB66BDA245B814AA7D0@SL2P216MB0105.KORP216.PROD.OUTLOOK.COM>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-6-sam@ravnborg.org>
In-Reply-To: <20200703184546.144664-6-sam@ravnborg.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
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
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Han Jingoo <jingoohan1@gmail.com>,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/3/20, 2:46 PM, Sam Ravnborg wrote:
>
> Improve the documentation for backlight_device and
> adapt it to kernel-doc style.
>
> The updated documentation is more strict on how locking is used.
> With the update neither update_lock nor ops_lock may be used
> outside the backlight core.
> This restriction was introduced to keep the locking simple
> by keeping it in the core.
> It was verified that this documents the current state by renaming
> update_lock => bl_update_lock and ops_lock => bl_ops_lock.
> The rename did not reveal any uses outside the backlight core.
> The rename is NOT part of this patch.
>
> v3:
>   - Update changelog to explain locking details (Daniel)
>
> v2:
>   - Add short intro to all fields (Daniel)
>   - Updated description of update_lock (Daniel)
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
 > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

It looks good!
Reviewed-by: Jingoo Han <jingoohan1@gmail.com>

For the rebase, if you don't know which branch of maintainer's git can be used,
linux-next tree [1] is useful. The linux-next git collects all next branches from 
other maintainers' git every day.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/

Thank you.

Best regards,
Jingoo Han

> ---
>  include/linux/backlight.h | 72 ++++++++++++++++++++++++++-------------
>  1 file changed, 49 insertions(+), 23 deletions(-)
.....
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
