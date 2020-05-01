Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 396431C17D8
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 16:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F317D6ECBC;
	Fri,  1 May 2020 14:34:46 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3373D6ECBC
 for <dri-devel@freedesktop.org>; Fri,  1 May 2020 14:34:46 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id y185so6385018vsy.8
 for <dri-devel@freedesktop.org>; Fri, 01 May 2020 07:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OafIZu0wl5yq5qjn+apPMv+CXZqAeKvj/lS9W7KUmfg=;
 b=bSkRbiyeyKlAUXC/Tij0LYdPA/GCDrTqy+eOsvg+0HMnmGzomgcFgIZwMrkFKKVTFx
 rY8tpU0oqwWB6Dgr1WBXsWo+XG8OHxSQyZFNutZh6UJLWPxJ5JTiiUQc32rVT9J+WYwK
 FlXoxI2nbxZJsuVKCqKMo1d+Br/kZKZFVpkOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OafIZu0wl5yq5qjn+apPMv+CXZqAeKvj/lS9W7KUmfg=;
 b=o5HCSU1K+C69jdkZsS2tET82C0R1WD10XxrpTZ96oFHlb005us1duEoPC21UiMBDvx
 p7AarspIr/5tp2yfk748WLtf7fVRUpNstOrwVgHRkx+7E4+9beXwxvm29lbSDJYXNFvq
 SDURUoAo1wrRTCW/EO0Zr6kAvcAS6UhH3pLyKejVbs9vEIckcGryN9vgvtebqMBcOyLy
 uZt7bkTHJ9JlyEyG9GCTG4L5QaOyfCWbdYiRccb2Li5mfGjHbGgFYYzcdtnu5bmOiMZo
 6O/2JRz/GUqs3KS1w/oD4yo+Xcx3eqoQ+uQQlGOjw0ACzLTcyeWhCqwTRAhY4Pw+PFav
 rfMQ==
X-Gm-Message-State: AGi0Pubh8/rMJw3G5PDeWUpMvtjHRP2E6AlNL4iTYafcredOGLgKGvui
 dGQGcVC3B+c5cIOFiQyG3fS5FiZlV4w=
X-Google-Smtp-Source: APiQypJ/pgfv7EfOd4KiEiMQFsIXpyQvKF2K+irV9pLFtZSx3ldn9TfPQYl58I2dV7abNgVzQ+RSWg==
X-Received: by 2002:a67:f951:: with SMTP id u17mr3501987vsq.12.1588343684937; 
 Fri, 01 May 2020 07:34:44 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id 91sm665981uag.4.2020.05.01.07.34.44
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 07:34:44 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id t8so3805349uap.3
 for <dri-devel@freedesktop.org>; Fri, 01 May 2020 07:34:44 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr3050483uak.91.1588343683637;
 Fri, 01 May 2020 07:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
 <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 May 2020 07:34:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X76J9FAwtx4-8pjEkEqSo=2rz4Wv2ZR6c1Zps21b1E7w@mail.gmail.com>
Message-ID: <CAD=FV=X76J9FAwtx4-8pjEkEqSo=2rz4Wv2ZR6c1Zps21b1E7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm-smmu: Add sc7180 compatible string
To: Sharat Masetty <smasetty@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch simply adds a new compatible string for SC7180 platform.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
