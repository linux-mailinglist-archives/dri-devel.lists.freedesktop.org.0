Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEEB481014
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 06:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76FF10E242;
	Wed, 29 Dec 2021 05:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47DF10E242
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 05:36:18 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id 2so17598254pgb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 21:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Nsu5SLu33j/sE27MQRMv94REvtF5KHoUUdJ/rRJCBKc=;
 b=LhGTWxNvS8f/k6IwrYBQ9w+endDRu4HsYOTFu77KuXJeWzeMmaw4hKbczXWI/szDDk
 wS4FZUCSdhkkh2Mn4fAK/stz6O2G7EcqFlEBlPQpKd8E6vA9/z8DzNyE6Ix4EwfqQFOF
 wjEckNlMPsww8Z5MFcn/GJUpSlbdroyWpjmndn9A/3brVFseH0ZbtG8hzf3O0OykSxWZ
 B0ZVZq/f2NHlyuqqmNdQFMZEy5B9BSd62iU0AYsI7oM7jKhW/0J20tjrdxvJVGjuDGF5
 45ARdKJqro60BwRNng8lAOOynIvKiiijeukxyu01rlWZpyq4hFhRrthVM7Kh95aisejd
 ynpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nsu5SLu33j/sE27MQRMv94REvtF5KHoUUdJ/rRJCBKc=;
 b=rijO1UbzDJmsogB1t4Mb+h4oTVk8RGY9kDYWwHHpwb9O1pUrGpBLZi1czyuyobuVKY
 2ifNekjVaBfyArne3Mtj3SFZRVIY86USqi3K0QrmBE0nzTbPi73DMNiNCB/9KVxlncgP
 ILjCKjW8JGgCsiz/WOeUU2qrt0uPmY6UieqJzKOhP6Iy92cZJxYY4kdxC7VK2f27zQ1D
 YGRsMUfll/yytlc5Ia6RTu0Wt2bFzRC0LUxZTT3YdqE8ByVizypBCT3Ip/DDJuRFsZJV
 Xmz8AW+IpgOmbIePFWKjqYNcDjTQ6apQPpvlcEoLBNmjYUL2o0oieLaLoB0uDnVt+gIH
 RsfQ==
X-Gm-Message-State: AOAM532FIVdGeb8F7v5W53wy7R9o3TWHkiznZDjrqbQU8TRfQtYoS79W
 sp1/mkD2EeqhQDwZeJz3sE54hA==
X-Google-Smtp-Source: ABdhPJzQuki0iGD+cAH6k2vcVjIwQQyRJUo+cD69ZoMLZ/4KGBWqzam4XH+vbVYrMkUhzsc3Kiugrw==
X-Received: by 2002:aa7:8bc3:0:b0:4bb:d87:c988 with SMTP id
 s3-20020aa78bc3000000b004bb0d87c988mr25335502pfd.66.1640756178267; 
 Tue, 28 Dec 2021 21:36:18 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
 by smtp.gmail.com with ESMTPSA id bg23sm20695639pjb.24.2021.12.28.21.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 21:36:18 -0800 (PST)
Date: Wed, 29 Dec 2021 13:36:13 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v2, 02/12] media: mtk-vcodec: Using firmware type to
 separate different firmware architecture
Message-ID: <YcvzzZJJBoVtsU/y@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-3-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-3-yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Steve Cho <stevecho@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 28, 2021 at 05:41:36PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> 
> MT8173 platform use vpu firmware, mt8183/mt8192 will use scp
> firmware instead, using chip name is not reasonable to separate
> different firmware architecture. Using firmware type is much better.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
