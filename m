Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED69B231A6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 20:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84B010E61F;
	Tue, 12 Aug 2025 18:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Q21yak85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A926610E61F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 18:07:24 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-76bc61152d8so5004386b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 11:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755022043; x=1755626843;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QLI0oP+F14LEUtSgUVTWdoo7hH4GRbMvsU76C8jeEK0=;
 b=Q21yak85qkOjfLdOrZpZ/obcK3K9552XaWLlXq1gIasAHCuXLyiE8+K2qTUgb7c+G9
 4vrTd5NJ+/B0eOa7AYVDyDekTmldVCEikm8STuG4vhPJbvN97Q5Dj4CTHslFMe88ZB1p
 n1tSLZoELH0RNBiDKqmw8GNcLmAV/jnTUFVQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755022043; x=1755626843;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QLI0oP+F14LEUtSgUVTWdoo7hH4GRbMvsU76C8jeEK0=;
 b=LM0geHLkmI1AowI0R+cxYxj32eNry+twB0Kr7LGw1qhLXNayCZikMirJ/2XZJ5eBhp
 oZ23161hWGtdznPIjyCRVX16NW72Y+KL9VyoV5j1YhwpissXr7jQdFoLY+IEkt8Atgn1
 HBOmxRhL/+7DaZGsi/jtYvOxqu4bae86DD/AxE4/r0yKUEZVQn/MMrzVUgU4lSrTynUs
 YcFMEOVcmzJ5BJ6O92xsasak34cJi8ZDpPdUBAm/+AX4dEpWMfv2VMe3UXOWDTCxdyvr
 Jtt6g3kldF08CJsyfGYEIiy2QBMPt7FwuM6VzXVFvwTfiJ1HglMtJvZm4TVLW8aaMIAo
 7Kbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK5hvCYqdQu4qoFmJwya//DILmMyR2+wdAtcC2rO7/NPlp2E97LgHOeXxrh8blpWW0AFqJ7RtH1KA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqiCMZn0X+gReBL7wNe3nDbJE6iDVfDFf/uScqKRTvJFw8Alu9
 QSgVSMuzbVh/6tPA8xpZOck2YI7TmDJCdYJp1ZMhkKYpQkN2OfLWf9tKoT9n610nA2ZtNEop68S
 AM/8=
X-Gm-Gg: ASbGncsgr/CprHnWql0JWNAsBDT9q/vE5XIZWGLp6odEFz3QpjSlI2JPtnrfDB1jfOO
 ffz23t6Dr9/aUhOXV33Kpi656+znbhYp/rgUnUAzOgFNUKVBeWdNaYjpAdR7dGZqPUxlB+lq5A1
 kP3Bkg8Sf3QQX43+X+Q+XxqGvE6pOSp8JmagVB907WIk1Z55art8qnj6TxG5koiq9giXqp5YWMM
 MfiHjyi6fYjMWeKug11QgYCC9gKq7+Jifw2L/kF/tgu80MDreC4/tLlxjh0lQkE/TlergbqlaTM
 1+XMdz0hbp9WFFGnJijYsPdFl6UG7Iu+31Hc0834CQ1I87jOsFCJ0+JF6sKwxU1j0IoHXN2UmV0
 n2USnhxVwNB3BQWIbH7byNOTrvkKnkqsXLluFtAbpwql/I+EQQVletSRE0GRQK+AKaQ==
X-Google-Smtp-Source: AGHT+IFQcjZqVX0eXeoH2kPf8xcoOCGbgSZHO3OJE15F5ggvbw/282A0LDfu5HtvsGfNOuYiqBbIhA==
X-Received: by 2002:a05:6300:2109:b0:23d:67f9:5c3d with SMTP id
 adf61e73a8af0-240a8ad3b92mr314055637.19.1755022042800; 
 Tue, 12 Aug 2025 11:07:22 -0700 (PDT)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com.
 [209.85.215.176]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfc0a2asm30068830b3a.70.2025.08.12.11.07.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 11:07:21 -0700 (PDT)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b2c4331c50eso4310461a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 11:07:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVptrf/d1xMBpFQ4V3S8BB0lSvug8ZjmmqPKZeaYoHZzg0hPa3Mnu+wPD1o2mX5UYa4GOReQG0J8Es=@lists.freedesktop.org
X-Received: by 2002:a17:902:dac8:b0:240:3e72:efb3 with SMTP id
 d9443c01a7336-2430d2339a8mr1635395ad.43.1755022040938; Tue, 12 Aug 2025
 11:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250812082135.3351172-1-fshao@chromium.org>
 <20250812082135.3351172-2-fshao@chromium.org>
In-Reply-To: <20250812082135.3351172-2-fshao@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 12 Aug 2025 11:07:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_CiSoXyKkg8jBJLPKe3WDBpLEOAngQJNnN8yZfaC+qw@mail.gmail.com>
X-Gm-Features: Ac12FXy6bsmvYuZD83Q3h0I_SweeUYDQdTDt5N36mwyv9Lq7Agta6Te3OZSZQgg
Message-ID: <CAD=FV=X_CiSoXyKkg8jBJLPKe3WDBpLEOAngQJNnN8yZfaC+qw@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] drm_bridge: register content protect property
To: Fei Shao <fshao@chromium.org>
Cc: Hubert Mazur <hmazur@google.com>, Sean Paul <seanpaul@chromium.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Aug 12, 2025 at 1:23=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
:
>
> From: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Some bridges can update HDCP status based on userspace requests if they
> support HDCP.
>
> The HDCP property is created after connector initialization and before
> registration, just like other connector properties.
>
> Add the content protection property to the connector if a bridge
> supports HDCP.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>

nit: your Signed-off-by should always be moved to the bottom when
posting patches. I wouldn't bother re-posting just for that, though...
I can also independently confirm that Sean provided his Reviewed-by
tag and then it will be covered by my Signed-off-by.

As per my response to the cover letter [1], I'll plan to land both
patches midway through next week unless there are objections.

[1] https://lore.kernel.org/r/CAD=3DFV=3DU+Zh2V2r-THx25Qw7W-Fu_qM4v-+Evi+1t=
BCg92ieYKg@mail.gmail.com/

-Doug
