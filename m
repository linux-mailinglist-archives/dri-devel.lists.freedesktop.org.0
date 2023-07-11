Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFB074EC73
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 13:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5451910E374;
	Tue, 11 Jul 2023 11:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2BB10E37F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:13:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbc1218262so63128555e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 04:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689074005; x=1691666005;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dLCSxIig1E6lDTEDhD9ibzAe8m3WEahllr3ouLgYn1c=;
 b=nzLVIA+PTb3SSi7DlWsGUsWL0rkRaezLG67wZ9+BrJp3AN5vFhk9E0dU6Vk52JEQKR
 2vLUlE/D2AteRhGj4dkHYehNCRxLhFq+LUlYcCZRPHvbm7eEpmU7fLT2U9Csc3sEues6
 t05grkaVvaeeg8n1TVm5MNd9z8nH1MAqcyU2CaWLXISalkxxjV7Xe5gxUKR9QmNOlkk+
 h+XoqvVHH6LnqoYvxTnbG9LNgn0+TDx0w9g8VedeMKOc+HEFDuU9xw36PM00it1+SSCA
 n5zaeQuoXryACKo6BTsqMOjcASK3ca8qDzOvq31ASaP592CcVNBYtvPlMOA4eKVY6img
 jBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689074005; x=1691666005;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLCSxIig1E6lDTEDhD9ibzAe8m3WEahllr3ouLgYn1c=;
 b=DMR2PS+TGCtpOz70kk2cNRbRAHObn0asUAhTylU7imZdDa8UGGLoNoBuQMwz5XxxKN
 nyGNso/wHoebaRYcyd+tPZhXCbVErcibWFAoucbNSJ8d0p6dLN5BlgVoShjS/BkMmDhP
 XnR1AYMtVFNItBQI+K/zwsdWG2zDIBoJJrzq/7d2MZUTS6/+0JuIaMOsNGWCgwCZWzxK
 KBH64OMVCK9xXisdi+zIXMsNQ2DVHjv9lHKvPTZETIqVwGis/l+QgSz6ZQrYbwtON1zu
 2A74APw6VpfwPnlxbSToZei048YthDDo9uRkliYWOLzmsJ68GncAScsXL0v2FBW52c5U
 +7tw==
X-Gm-Message-State: ABy/qLbs9AUkj6GCMQ7PlJXHFfVm6UN8r7rkMnXnEP5bQqRnSCj9eeEa
 lZ8H3SN9zsaeTSJ5oxkEg/2piw==
X-Google-Smtp-Source: APBJJlHUs43WSGSKNzoDZD3KQlU5rLMuF/7dsLdNmMbgfPJIjEa2I2xQi/A5h+V8aI33ZuQwpwX8Uw==
X-Received: by 2002:a1c:f706:0:b0:3fb:b637:22a7 with SMTP id
 v6-20020a1cf706000000b003fbb63722a7mr16506974wmh.4.1689074004968; 
 Tue, 11 Jul 2023 04:13:24 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 a19-20020a05600c225300b003fbb0c01d4bsm2259571wmm.16.2023.07.11.04.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 04:13:23 -0700 (PDT)
Date: Tue, 11 Jul 2023 14:13:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] drm/virtio: remove some redundant code
Message-ID: <7f67ed65-647a-44d7-a262-d3f1f48d90b9@kadam.mountain>
References: <20230711090030.692551-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711090030.692551-1-suhui@nfschina.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org,
 kraxel@redhat.com, airlied@redhat.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 11, 2023 at 05:00:31PM +0800, Su Hui wrote:
> virtio_gpu_get_vbuf always be successful,
> so remove the error judgment.
> 

No, just ignore the static checker false positive in this case.  The
intent of the code is clear that if it did have an error it should
return an error pointer.

regards,
dan carpenter

