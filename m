Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3D05B3674
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B623610E008;
	Fri,  9 Sep 2022 11:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AADD10E008
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:36:25 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso1085116wmr.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 04:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eMfi4sj8sxdilltEjT3o0CYqu/07v37iL0oI9NwLuhQ=;
 b=xXitpySp81/iq5mCHbx1NL8ZY6KlIzQ2Rm0uNjQizzQDLBQmsIKIH+CCmZJqYEV/aj
 8VYnxt2C6ZjL/NTMjKjqNBjgyraFcIq4GJ6iuWoExRQlc8mVmFsDvlk+4ChybibvaJKw
 Q1wK+sQ5Gqay66QK/o5X6z+W+xAhcOAFSRqKlG+0557aFl8BLOYLQAju9meHM+hi4BE9
 abFHZTbce1cN+D998Mv3YYqrGmasXmFUbWtNpEBca3MTIqsqII8iYafZfe2rh5oGj+ht
 VPbbb487QpqIHXE4u6/mROYOYVqnGx8Nnw4P2KtqOcRoeGswB2HFIYrUlAR6BEFOg6az
 JHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eMfi4sj8sxdilltEjT3o0CYqu/07v37iL0oI9NwLuhQ=;
 b=v61Tm8XOF/nWUirPoBfXOdjSJ8tTV8W2qO4VmTeN2RGcNzFw/+yU1yAqNOgFwRvGmO
 L5Wr6I28CFP6xJFid1t0EtB500CEkgyBj5CChfqa26YvC9IAc6DLw5OI4tSpgPQ+54aE
 BlJ3UJooBx4Z61NkL44s17LatLqc0wM4cGtD/+AmSFx5gT6P+t28kD4eGk0DgTtDP1qh
 5Zlw9fBswNqkesIpt5s1GXnPSZD5HyCgXheXVXOSqBktXRvYYfkqx9xsjPJetpOeR3gA
 NbBRUzvYvu8YJ2glQNJk+BFbbe00jmnR4+NemqmJ3c/SKNpi23r/y4vWh1RPFVderjbY
 SOGA==
X-Gm-Message-State: ACgBeo35t4G3P1ev+B3Oxsw9YpOm0qilP5Euh1TlGVmzWiyXxReL8+vk
 rc8F9ffX8WlfXdZfjTim+iksAw==
X-Google-Smtp-Source: AA6agR5Hz6kkduJeRFgp/DA6BwlkbNwFTw/nfrGwXvXISQa+66SCJbXRvxHYQfYYcMMhOCPKMIWT+w==
X-Received: by 2002:a05:600c:4f53:b0:3a6:9d3c:47e9 with SMTP id
 m19-20020a05600c4f5300b003a69d3c47e9mr5330903wmq.116.1662723383738; 
 Fri, 09 Sep 2022 04:36:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a5d634e000000b00228da396f9dsm272862wrw.84.2022.09.09.04.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 04:36:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: Re: [PATCH] drm/meson: Correct OSD1 global alpha value
Date: Fri,  9 Sep 2022 13:36:21 +0200
Message-Id: <166272336889.954213.3103687270457215628.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908155103.686904-1-stuart.menefy@mathembedded.com>
References: <20220908155103.686904-1-stuart.menefy@mathembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 8 Sep 2022 16:51:03 +0100, Stuart Menefy wrote:
> VIU_OSD1_CTRL_STAT.GLOBAL_ALPHA is a 9 bit field, so the maximum
> value is 0x100 not 0xff.
> 
> This matches the vendor kernel.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: Correct OSD1 global alpha value
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6836829c8ea453c9e3e518e61539e35881c8ed5f

-- 
Neil
