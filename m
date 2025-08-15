Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACCDB27F05
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 13:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C14D10E92B;
	Fri, 15 Aug 2025 11:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="ViQi6hpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAD510E92B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 11:17:59 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7e8702fd3b2so191766685a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 04:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1755256679; x=1755861479;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NQuxMnIum4rjvf5wJelGGvmNmA6J6RH2z1zUhaLT4T0=;
 b=ViQi6hpMyJWZdOG4HxYGG4GriMqQwO5uJhTmHCrr2/dn+KTR7+irAulIn7M7Qd67gJ
 FfzY6IEc+iezjBByBA93z+ZyO3Tnx7GjPVq/Ai5etR4teS6Nuh294uqQhdhf76JHxNqw
 FFSYBXkhH0+EpuGhOCdvl2JXeifdOXqCyNU7xaJ3nvDijqbPB8q23K/7ruzUaRDFcgjn
 hSkftAirkUk0oI5ieUK8tbvvRs+EXydkm00i4uvP5qsPiKozpg19T+3tFwlzVDJslI8u
 OLssflYxAyuBO2ayb+Z4l/bri3LKiDKthauWLJO2+EADo1od+ms3h9ZUQ2Lcfe4zE1tT
 jgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755256679; x=1755861479;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NQuxMnIum4rjvf5wJelGGvmNmA6J6RH2z1zUhaLT4T0=;
 b=QUcb4x6bUmaZEGKCvW26+Jry1ee7MB18hnvPVzc6QlxAobUzbH5w23EBoylXRjYQUm
 4R6Hs1NCqsTvNVaNZ/Sz2973bBBg3lrKPwT3wVcXkOphigXsI7NVBWnhVQZ2K+hfcUle
 jghZsyCis9qNKgKrATUWGm8N+A2RrYj0fkLKMcQrBzQF9rF03tHYDK9TVUjgoXw8fvBn
 LAxq5uNVHRjIkhGbdTd+RpbpmtDsIgHtkxdNl1h9CvRcAjXUsM06DKaMKaH2l+iXpVBM
 iIWFif5UsXt2yMrExXAYpGWAmBUY+QxYb+Dot5XDVtnPvwdMzxefJAkSsRooE6e++gIG
 ZcQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2/gDEZCAj2/xXT0ZGIQNv1dZl2l8VXviZpDbsQjsgop/fN1sx3KJKoOjbVDodkqSNqLX4MEHi5LE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzqi6gjReGL1Iqpp/1M6g2nCKpvgpZeXpmoWX7T2C+ebPoDIBFO
 2IhJGkPFcu4Apm/fHHgeKnpVyEsmoTKFVduT7bbibMeXjGLT7SuJFMTyJJGNOW9ziC053fD9jPr
 NUZxuJqgDMFwMvOebFUa4I9hoqxUo4l9xxKEco/IeqQ==
X-Gm-Gg: ASbGncs22gOs9oTGJNiY7PYSHq2uFn6EtHtLsjAyp8FxyAYEOfZa94h7DG2O+6BkpDc
 wogNcEV+5o/r8c8ni07LIotl+IV7Yiph9BkzOY42rgyhRe0VTZ0IV8cvof6HaB/Xz5FRClmeiZe
 ZCKp9WMvecKHsmkvwY10QWLojXBDWnKWR+7/CNOhf/wsZjDNH48Y+6SxilGh8nxePJ/BcdtwWqT
 okXRaU=
X-Google-Smtp-Source: AGHT+IFgacFlGX+wQD71QQnZi8rjVfqAYc3kQpR6Lpo+nRIokXuryBMbxhyDQFzjfuqPiOWbzEJ45Qq8/CfCGpJf/HE=
X-Received: by 2002:a05:620a:1a9b:b0:7e7:fe10:60ac with SMTP id
 af79cd13be357-7e87e05f9c0mr188670485a.33.1755256678577; Fri, 15 Aug 2025
 04:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250815102539.39711-1-steven.price@arm.com>
In-Reply-To: <20250815102539.39711-1-steven.price@arm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 15 Aug 2025 12:17:46 +0100
X-Gm-Features: Ac12FXx9MLgVJhNinClmSB-7eBe7dwYDiVAAxdaVcixGjfFRjKyYhpR2-6JFfcI
Message-ID: <CAPj87rPSoYe10JqpwYO=-tTX2EqnwB29wrYfhyWwpAyAczRVig@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: Remove dead code in
 mmu_hw_do_operation_locked
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Karunika Choo <karunika.choo@arm.com>, Chia-I Wu <olvaffe@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven,

On Fri, 15 Aug 2025 at 11:25, Steven Price <steven.price@arm.com> wrote:
> The only callers to mmu_hw_do_operation_locked() pass an 'op' of either
> AS_COMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT. So remove the code paths
> that test for other operations and add a drm_WARN_ON() to catch the
> posibility of others appearing the future.

Thanks! I think it would make sense to also inline
mmu_hw_do_flush_on_gpu_ctrl() here though.

Cheers,
Daniel
