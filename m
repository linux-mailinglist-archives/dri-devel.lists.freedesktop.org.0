Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5FAA1755A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 02:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9274B10E4AA;
	Tue, 21 Jan 2025 01:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="i/qmBaiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB9310E4AA;
 Tue, 21 Jan 2025 01:00:02 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id B591A3240BE;
 Tue, 21 Jan 2025 00:59:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1737421198; bh=CkwoxWESXNcXMmZ7s2mD76S7ybGw8Kl6aaukujWpS1c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=i/qmBaiSCFcaYyCYnmku7snewTzRZ34PW0ED6n/RXbBvU8MrCTd7HA8CsdpmWvsGa
 oZCdmvOpmQ+sIb9H31LBfyX4nKWS+M96J27JNU18IjEFo4anx5AEcgZpn+rLm3VeKn
 PUm88LfBQJgyf0NrIjNrvk/wKkO225rOop949FIy21AgAYNkuH6evF7Ek6LQRq4HcR
 00OUPI5Jmb4RcJn8nEqudC1v2uBougZcJp2upBS9x0HXGl6j/9JVjAS1+8a6hxl9Zy
 Sr6Tk+9ce1VFZ7n4Hx3t1h0IOlKTm6aPtaAxcfdW9eQnbj5l7/THyQOreJmdYy9K/W
 T/BfFok2sOYqg==
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso840432766b.3; 
 Mon, 20 Jan 2025 16:59:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUEEUa0zjxhyEQxxGd9qTgiYTDOS+k2YADwpMf5+MPPyU71trXIO5qG2qC+zJ5yUN2BpJxvqnzA@lists.freedesktop.org,
 AJvYcCUTasT1T1hwIOnyQeI4p6I5r4FYuxW9RJTx90VTe6NI0k8ELpmK3jG0b35mQmSopaYnvVMsl5Jp2uuJ@lists.freedesktop.org,
 AJvYcCVCH23JlfYRWgyhVJynDHMOcXaW3YPv9fl7ID/jdWkVwhJQeIRoO1Q7rY51vMp1mJ/eLPi27rbTQAY=@lists.freedesktop.org,
 AJvYcCXptH+iFetihqD3qDFwn+R2QW2rKfEWM7P4m+Tt1KNWUASQArYF0OV32EzVyDEia99x3VCMWe8PUZQN@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2SeuvPmZ7cvGjwXmmB5PBkiwgqysAE2/ACacRLM/CKwMfIMZ4
 RK6y9aSjoTOhWttmiD3kYMu5aAgDsv7KABle4r8+2KGOwXQxnumUFF4ZbOIG9G7ly0so5Pd5yuG
 Lp8IeLQmJ8xxP6OuQ4K3ql8qQNgM=
X-Google-Smtp-Source: AGHT+IHWjJmow8W95O/jnjybriW0t5JeZFQUA4ExgR0utqovF7K16cEfkE60tz4dkdsEYis7VCTx+AhqD8irrs+GXTk=
X-Received: by 2002:a17:907:97c8:b0:ab2:c208:732d with SMTP id
 a640c23a62f3a-ab38b3840f3mr1375840566b.40.1737421198223; Mon, 20 Jan 2025
 16:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20241128153707.1294347-1-raag.jadav@intel.com>
In-Reply-To: <20241128153707.1294347-1-raag.jadav@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Tue, 21 Jan 2025 01:59:47 +0100
X-Gmail-Original-Message-ID: <CAFZQkGwJ4qgHV8WTp2=svJ_VXhb-+Y8_VNtKB=jLsk6DqMYp9w@mail.gmail.com>
X-Gm-Features: AbW1kvbLlAQjTqa9LUa9lNjlyS2jIj_z2nRscjceoujIm2WjZlTFBKAO1ojrhLc
Message-ID: <CAFZQkGwJ4qgHV8WTp2=svJ_VXhb-+Y8_VNtKB=jLsk6DqMYp9w@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] Introduce DRM device wedged event
To: Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com, 
 andriy.shevchenko@linux.intel.com, lina@asahilina.net, 
 michal.wajdeczko@intel.com, christian.koenig@amd.com, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com, 
 alexander.deucher@amd.com, andrealmeid@igalia.com, 
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
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

Hi,

I experimented with using this in KWin, and
https://invent.kde.org/plasma/kwin/-/merge_requests/7027/diffs?commit_id=6da40f1b9e2bc94615a436de4778880cee16f940
makes it fall back to a software renderer when a rebind is required to
recover the GPU.
Making it also survive the rebind properly is more challenging
(current version of the MR doesn't do it for you and just crashes if
you do it with a udev rule or manually), but it's doable - and not a
problem of the API.

I'd really like to have the PID of the client that triggered the GPU
reset, so that we can kill it if multiple resets are triggered in a
row (or switch to software rendering if it's KWin itself) and show a
user-friendly notification about why their app(s) crashed, but that
can be added later.

- Xaver
