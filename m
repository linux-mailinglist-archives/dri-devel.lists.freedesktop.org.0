Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE8342D52F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 10:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882956EC2D;
	Thu, 14 Oct 2021 08:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A800B6EC2D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 08:36:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i12so16897900wrb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 01:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cfakvhen/wxw5fHdRu0DEuLT5DMfJlXe2a/johLjqxo=;
 b=h40uJnzRy4bIKfqfvwm3i/kik60+Kgx2sfXbHxmv0MsZax7HkeDmryc9yctryM7xlU
 37bg2VuoZWdH4kTXGosC95Fa3QYJayYirIbI/UeFVNH/Nzn2/7/VodB6g1hiMuG9zp+p
 egl0Br7pM5vnKxSuUDa7BUq17cmPH9MsIYOosVtDeEDQMUaCZ6h+AWD2esXOH1LRk+zZ
 X2uV1Nn3ulaudun/4f5AT6jS5oilV0myDq9ozSQAqUnytF1YgcEInQmj+cCLjl5OgT5o
 004n5bwSXge4iP3a4skCS8avlQccw5QvPN8BVpAjam8zZmlkvShcDVpQvgmxjplGDMKz
 pkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cfakvhen/wxw5fHdRu0DEuLT5DMfJlXe2a/johLjqxo=;
 b=d11OIqj7AabC/lhDJNXNdc6OUJBFTiGtMWvRxqfT7dOvDc9orK15BRTcu4nMvpOkBP
 sUAimRQST1F4IU85ZheuPxQgF6dwo9deX56H5URpCJvVMqaYtaTeD6cKwPt9n60PyD1z
 /KI7k88wqoWpWNpr/cAFNpydUX1zGPIP7jZgjWeHgeOBrNIHPR3DrVOCJHbWDh4G1xan
 57D+lqN2Xs2gL+ihUrfdY3JXwakpQGz9T46PCTPzOqFfRBjK6acpJ/Vwxo0eine1eY7e
 DJV9kmpBuH3K/vX3KJRuOky9TZb8kM+yItJgNm7/+KtjKrAjFMn/ag+t5L8g33ryF9b/
 nbbQ==
X-Gm-Message-State: AOAM533YcOvQXs3x5XnXQ2oEI/vVZYaijKKnYgdFWON8Q6LGobafumEc
 2Gkk2kcVmNeIM1E4SnjIs73Kow==
X-Google-Smtp-Source: ABdhPJzpVg8OIER+zTALG2ilasSHxD7bC/dTlVAeWBUDgRwrRvN9DCthCd2lRX0ZyZDpw2FTk6Hq6g==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr5151873wrr.386.1634200593067; 
 Thu, 14 Oct 2021 01:36:33 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id r4sm2299114wrz.58.2021.10.14.01.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 01:36:32 -0700 (PDT)
Date: Thu, 14 Oct 2021 09:36:09 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jie Deng <jie.deng@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Kalle Valo <kvalo@codeaurora.org>, Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Eric Van Hensbergen <ericvh@gmail.com>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-um@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, kvm@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH RFC] virtio: wrap config->reset calls
Message-ID: <YWfr+Z0wgpQ48yC5@myrica>
References: <20211013105226.20225-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013105226.20225-1-mst@redhat.com>
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

On Wed, Oct 13, 2021 at 06:55:31AM -0400, Michael S. Tsirkin wrote:
> This will enable cleanups down the road.
> The idea is to disable cbs, then add "flush_queued_cbs" callback
> as a parameter, this way drivers can flush any work
> queued after callbacks have been disabled.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---

>  drivers/iommu/virtio-iommu.c               | 2 +-

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
