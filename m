Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0520F455479
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 06:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8E56E9B7;
	Thu, 18 Nov 2021 05:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2976E9B5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 05:55:21 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id iq11so4227654pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 21:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+LR/apPrtZKwX6W08eJakocjLm3Seep1Fatf1AgQePE=;
 b=WczWOO1s1XTU4qJAIKd234QMOX1cq2L4vu4MeG5F0oiY0ZpKWJC9OrpLq+8JJqpEeB
 nGDoz8QYuloO/gaGIUc3NFyL5sPJU5eRawPT7FnaUHnySMUX8IMueKpOKpMMENQGQVN2
 VqZ3CvkiyTKzPG29KaIQVSwJzDxHf/dq4yyoHRArFNV1IS5iLXyAZvFqMaPeOgyVoYer
 qnSeCmnXvmmEKSWdBOTuLemf7Y3DgfNH1a9ilXjXpG8+SK6GUZ+geCR9C/cSnzur94SN
 KUXyZuFq5kc2O4oYQLQhJDw1DMB3R7fm4AYmZE/3nVk5jrKgsa40daUJw26YfSVW7/Qk
 3isA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+LR/apPrtZKwX6W08eJakocjLm3Seep1Fatf1AgQePE=;
 b=M3DdV5Uapsn+tCjFQi/ZMzqzZIuKOItYIWTqcrS6+IAe4R4zIbF7bQl7/wMGYlvLX0
 kQtRdZZzRqvyySNoRF4E4YMqUaMd8Gt6VBa4z1z7Pv5/hrY9ePRineSZHsW5pYzvYIIj
 0QhLu1ADHK4oTzDjG95AYIFYZ5Gt+2G3/T180GejdlklcQar9aGmh1RzT9bQ5IyOTQlV
 r9NkbzDu3+wtDicpsIQewLhEjwZppwWuJr8RVws8lkbOaILHwaduyJ5AQOLxztupOMJ5
 1G0ae4WMPiofZJBstPcCNRPxPwenSrOWNUYYDPUnU7bHHnW1SyB7lf1/VBDCDWH8c083
 +4+w==
X-Gm-Message-State: AOAM532cZzGQ8N+Lp5aJ0vdGl72uyTKNrKLDdKMAahgeNnHg8P9Djz6G
 Cz0q7e0jhaRfgCYusbBFBzVZzA==
X-Google-Smtp-Source: ABdhPJwQu46s7ekkE9XfTwzdQPD0BH1cjVXVpoAOyFEXdDui27VB7CUt0BHK6NpvxLu2wbCzqw6+Vw==
X-Received: by 2002:a17:90b:4a89:: with SMTP id
 lp9mr7478443pjb.6.1637214921042; 
 Wed, 17 Nov 2021 21:55:21 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8f8:11d:a96a:74d2])
 by smtp.gmail.com with ESMTPSA id j6sm1180718pgf.60.2021.11.17.21.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 21:55:20 -0800 (PST)
Date: Thu, 18 Nov 2021 13:55:17 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Subject: Re: [PATCH 1/3] mialbox: move cmdq suspend,resume and remove after
 cmdq_mbox_flush
Message-ID: <YZXqxaVANvrv53t3@google.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <20211117064158.27451-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117064158.27451-2-jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 02:41:56PM +0800, jason-jh.lin wrote:

Typo in the commit title "mialbox: move cmdq suspend,resume and remove after cmdq_mbox_flush".

s/mialbox/mailbox/
