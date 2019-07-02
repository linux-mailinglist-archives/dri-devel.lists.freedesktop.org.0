Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5794F5DE87
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCAB6E0E6;
	Wed,  3 Jul 2019 07:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E72E89FD1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 17:05:37 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id m24so38783965ioo.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 10:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YKfKPoeyT0KuofxV7ur9+vGd3ucwK2w5OgqwlMB2kjo=;
 b=Oja83zLl4RsE/1Mk56mu0AeqlUPSTVsogha+xPg7ziTVDgC9+bqKzlalxCY/0bQDcd
 qoeuVKAEK9tWYVtXxiNyuJoGMMnNMZZqKaeW170YuyNnmhzc1cFCgw8y59XNNiDbMJvT
 soyW0ox0FY48JBkipuD610zLHNMvqa2is0DRWY3yNEmLOqt1vV02T1P5rh5qK89NiF0V
 5iAAxEUCyoZE2QCtqKjgJntCKNFHWCahuJVnRExNVo2s5hXN4Wl/6WUDQORNriBdA2G2
 gHn/q11SP+uzrMD6v1nfr6QCoeEzrqFBLrd40SQigO8BH04BKh9O07APeMrf1t2vFwB7
 nqLA==
X-Gm-Message-State: APjAAAUDKVaddBAqeqKQOgJTyXaNcUcMzKbTLjgccKY45SH+fOFYlK8B
 vNt1go7O3AvQ3Lm5HCA9k1RnZapzP6+4z/NSoSc=
X-Google-Smtp-Source: APXvYqxs/hDXot9vuVIf+rT1Mq0edFTyI+t38Zvd0D5AAG835eIo+vch/SYLmZlG9JOrZ6ASoAZ8Ps6XWgC7yyHesv8=
X-Received: by 2002:a6b:901:: with SMTP id t1mr27892285ioi.42.1562087136966;
 Tue, 02 Jul 2019 10:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190702154419.20812-1-robdclark@gmail.com>
 <20190702154419.20812-3-robdclark@gmail.com>
In-Reply-To: <20190702154419.20812-3-robdclark@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 2 Jul 2019 11:05:26 -0600
Message-ID: <CAOCk7Np-eCQUmmwvHq7tJEz8OgHOWbtedsvb0bt+1UA6aYxKqg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: add debugfs
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YKfKPoeyT0KuofxV7ur9+vGd3ucwK2w5OgqwlMB2kjo=;
 b=ehiVyESmaJVL8d6dsoIJA9PzBnBTjQL+V7P6W3bSGJk7C4CAotyLCqeYPhMazPoegt
 BXBHK9Lp0bh5wxqLmIMgCsYOjoheOiniT/gtB5Z5ufGAEOqGj0uz4KVpsUQkeyhVenj8
 GXFGrqREKTRNdxiNFaCX1hamvE8FlBLrg2HvGYtHUxSsLYX3n9x/EMFCZztRdOEupohH
 9oYAQI1mQSjcQJ7rZDqlvZRrnac1gtnuak3XLX7hy6KbuplsIuWq040RAwUxPyW3nNki
 JvIYe8DESD61dZWJsFshze8aYVhmLN5F11ad/bz7B5PlHZhPCdIcY2+amH3kYAzOU4XS
 zrvA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCA5OjQ2IEFNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+
Cj4KPiBBZGQgYSBkZWJ1Z2ZzIGZpbGUgdG8gc2hvdyBzdGF0dXMgcmVnaXN0ZXJzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQt
Ynk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
