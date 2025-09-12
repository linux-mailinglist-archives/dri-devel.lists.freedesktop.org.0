Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B658CB5527C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3D510EC85;
	Fri, 12 Sep 2025 14:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="R1w6TFFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B8710EC85
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:58:41 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b54a8c2eb5cso1233144a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757689121; x=1758293921;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JsRA2lsMsTyTq/Puo1W1+q3FiI8YEvM95g5Tez17y0c=;
 b=R1w6TFFkgfZkDZSW+ePqf7sGQRAHYg1tHsdANuGRHgQIkg7nEiveflqX+y5R6plf2I
 7s9ACLcDfs3n8Zz9HuCas5JSPTHju4m6/4oWZJxRo9mmWWQzNfD0xYCc1D98NkWOFOtD
 VVnZdDOzC9MK1xPBNgdQOykVaTSZRhDt23G69rfLJyZJcZa+ZUofDN5M0wu49bNqTKYT
 l8BDT/c0MDOA/yLeHEFP3ypDkI2I5pnxAxnaZuwbY8fB3PGtGEhHiBmKcMlgbmRzVYDZ
 X5EFR54EeXLPYF6Jp+SNNW+FvzoCI7q9cGjEcrGw2I00Dqb88J0i06GDOIYfqW0QFXJv
 uzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757689121; x=1758293921;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JsRA2lsMsTyTq/Puo1W1+q3FiI8YEvM95g5Tez17y0c=;
 b=SuFLqFyGo7fD7DIgOIjcCGqUZBURO2v3t45UA9WRSZiUpLH4rGNUA8vTIzSHpmVGXI
 7hgLO+0N0ZvPMmEKZ818r8h17f9TonihVCQDtWHIwWZHVqMob1wFH0axucVOpsmJhvaW
 /5vmDwhziaP0hpwNuFwM1krUEss0oy/4r5VhDk8VuvMvU/UtAm+eREESNKxydxSxK9XV
 pP/1q9jRJQc6wHhE0a84ZIUlChMpulNHbDsp93kDKtwkgJN40v3RdA7zLCsqMShmcQ3m
 pf4sDIHsaM52Ivwc3h2OHdPs913uYBYb+m35bmGnNtW4AU+PUUiP3gYnP9TTmiZL8gBg
 /1DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGtNK3u84Pdo1qNmHVfoLWfPEbN73OpfFO36r0UOi7S/q6wvtZDVDN/36OIXHTGH1DKNfUCgzPauI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKSd7VmmjuJzsQA9HTMlJiQ5KT1XLkUn8rNzpv+0MLcJyA7sAg
 e8Nl8KzNHLA8Llie9QwHeJpuNi5RGlWYFt5mNPk5QUNC0cpY7JPu6IxVMABxBtMbdKpPRfXs53u
 lkfizPXiJv8Y8fiPfgTo3dlVNBXLRqmnBdluoeahH
X-Gm-Gg: ASbGncuwAJqWpo8KgQ8z9l7JfpHllRbv2upKioSl5ig1NJUdFKGuNtd359Y17WLngiA
 cYNLsP1IiRUW/WJlQVTtMI55DH1PWTzU2MBzOa3t0NWGdGCwKj9vQJQ5bNTqRpajamHu4SdWIZg
 wYxAaHgtkyW3+0fTMqZ59nYoVbU7nuo0warfkxgncA39mqxXGmqKW0tAJDRQ2mOBbZskzjvyucm
 QqZDuQovdDMUYw3UOCsJC49zcofKmSXszGjuMA8KRIudzhA
X-Google-Smtp-Source: AGHT+IG8fHTK0JHRHJykqJ4UGg8mUkj8ySqnJAAwPbZ5I/l4ILqKzu2I8nV3bt5OAzXHc1cMAT83RGVQDVhLDpFSVOs=
X-Received: by 2002:a17:903:3804:b0:24d:f9f:de8f with SMTP id
 d9443c01a7336-25d25a73995mr47545065ad.17.1757689120635; Fri, 12 Sep 2025
 07:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250912131104.1726775-1-yanzhijian@huaqin.corp-partner.google.com>
In-Reply-To: <20250912131104.1726775-1-yanzhijian@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 12 Sep 2025 07:58:29 -0700
X-Gm-Features: Ac12FXz1H0aiUVuI2ZceyQFnUNMDlNBWtZs6Dx0LlgWmVPtY7LadNBf506fI8m4
Message-ID: <CAD=FV=XKOj42jkZWr7OF93=tsAsW+=pAk24JagFVFKZRtxEwMg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: add support for KD116N3730A07
To: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 12, 2025 at 6:11=E2=80=AFAM Zhijian Yan
<yanzhijian@huaqin.corp-partner.google.com> wrote:
>
> Signed-off-by: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Please provide the EDID in the commit message. See nearly all recent
commits to this file. Thanks!

-Doug
