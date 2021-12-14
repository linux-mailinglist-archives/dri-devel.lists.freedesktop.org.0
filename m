Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC242474539
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA48F10E532;
	Tue, 14 Dec 2021 14:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1520910E532
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 14:35:42 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id 207so28554928ljf.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 06:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bTETz2h6nLGm7FFtGoJfUkWZ0HDEaBtcfd+0ZBKXMvc=;
 b=n/QGO+OnyCitcGbUPZx3Pj35kVxNPf9kyMvy5oC1xVP14DSmebuH3o1n1RLUTmhZNW
 jM6Hftd6+0Vw9w4QOrJtPqLzTr6Galg4yDzcKYkvVGep2YoWV8jo/pooFE9d3VXAsAeF
 yR8llmpsTF1yiyeK5dPv57cq4YatfdGdOUADCthaLZrBFNY+FGxjlBcyBM4UMIPgm1VE
 xO5mVpHRw1w/fsdZ80+HXEBsv3ylsxaYXCUIGJ3CbSYDXio9oI3K/lT2Gnio7jEzV6RB
 F/2VutcgJBnB2y0ChlsbRGZk0BEevFPcQuz/5M4fXccj1+qPIonzL3cgfU4xjqAc6dnv
 rUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bTETz2h6nLGm7FFtGoJfUkWZ0HDEaBtcfd+0ZBKXMvc=;
 b=IwcYjTKqHL8VbhUjNEKrR0RoecmyMvyYNyi1Prf33ZWjAAhIptxlzNy9OLlGyp9N7m
 bXbO6dpouPfM6Q+GDzOHV9pC0yl9HaElA8nXkqC2rWjtO7aAKBLMvxzOxhku7DOl1QyU
 ZTTRXtDaxWX2yjXDoBBD82FjWNLRAhqTyAZb8C9HvMxrT8EXFSnBa8c49UfYjlsT8SDu
 zojFav9QIWZlQRxDUEX9J5Bpisqk7vDPv9Q5NgyYJuOz9Ewxulfwr0h/jDNnqM6qoPYc
 Espqw9WYbRlruE2I0DAUsbeoPPosjuIrRUkOZTrNoG12Lx8iiPdnqA2YCoVZ3HOwG/SR
 pIaQ==
X-Gm-Message-State: AOAM532QvVxC58ppqEAGSDMbJ6F5SlnQS4Kd656Qk+DcWwLwEk/vdfUA
 6SvV9NLzGv1aFeP2UY9Vi5k=
X-Google-Smtp-Source: ABdhPJxqBfOFfSpR6YQ9B8RrJ36CJEZUGHdsdWYWe/w8s6TzwBrY0PsUZf7c0DtQQSei90WL5dPVtA==
X-Received: by 2002:a2e:91ca:: with SMTP id u10mr5429166ljg.414.1639492540268; 
 Tue, 14 Dec 2021 06:35:40 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id g36sm1857154lfv.16.2021.12.14.06.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 06:35:39 -0800 (PST)
Subject: Re: [PATCH v2 0/8] Host1x context isolation support
To: Jon Hunter <jonathanh@nvidia.com>, joro@8bytes.org, will@kernel.org,
 robh+dt@kernel.org, robin.murphy@arm.com,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210916143302.2024933-1-mperttunen@nvidia.com>
 <10de82cf-27a5-8890-93a5-0e58c74e5bcc@kapsi.fi>
 <c382fb0e-6b73-5ca0-7f63-d2843351325e@nvidia.com>
 <91dddccd-a6c1-21b3-34d6-6a8082a386e7@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a507b10b-395b-1f6d-87b9-7c7c436cab0e@gmail.com>
Date: Tue, 14 Dec 2021 17:35:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <91dddccd-a6c1-21b3-34d6-6a8082a386e7@nvidia.com>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

14.12.2021 11:05, Jon Hunter пишет:
> Hi all,
> 
> Still no response on this :-(

I see only two patches on Tegra ML and others on DRI ML. Might be good
to start with re-sending this whole series and CCing MLs properly.

