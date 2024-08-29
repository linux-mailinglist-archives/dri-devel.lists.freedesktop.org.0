Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6316D964125
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 12:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B909F10E3A3;
	Thu, 29 Aug 2024 10:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HnW93fOr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18BC10E3B0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 10:17:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so4030605e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 03:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926676; x=1725531476; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cpJAK3u0wNHTYAsOsJ3G+ulHexNJQQgw5rassGX01aE=;
 b=HnW93fOrHy/vR/IuAyHPCoLywRMBRLX2gQ4AUl0Rb2XyuqtHoLnz3etc4wr1fh1wjc
 uGx7eeHgWQH8xhh9nkVzpypvlo1P2cZCPgCerWWvgZM7JMwtfOOjJCOqrOle9JYcpDu4
 TNqyUNB6smxw+j/piQuWlqi1OZl1jMGgEyfPrOgT+4NCE7A30hFQLI3gISIW9ypfqXmG
 cFz5m6x5jf8KB2WMXRtC0vAfsZi6zRZRSJwSVdYJdmJqe8NATF5TTgKnHs87dlca4zZg
 jwYHmscxURtERQip1XB8mhNdxmCL8JE2EZ8mWOt+eXwcG19YK2vJBGzWVvyaqpuOwi7y
 1JXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926676; x=1725531476;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cpJAK3u0wNHTYAsOsJ3G+ulHexNJQQgw5rassGX01aE=;
 b=s0XqD+EeG1nGhSKX6CDeTwTAyhxg7KaucEcwJ5pNc7tHGyCtX6QCALcaXRuBvjoV+f
 dgk20a6SL3Un7yqPN+MdjG/eGPmzNOOveTLXvn80iVrBwnyYc6i0Qd1q/aKIE74DNNZy
 KDRKX4Wa8t3j12Vl+tcEyZh1anCD5nZEYdB8a6RyktRtqD9QAnFMGQSO0QtjA9oM+T5X
 KTC7ghbzwcqrpZ7c4R4SbmuGv+26BDPHJRcQUuZKVktExh3hJh6hoLx2Py+Ycu+N6+qW
 Zgx3CNU8Qyp5+P+X+WZ6jzeE/lvV5f+cu1iSms03VkSv3zgakJaApGmn0R3wAlzeSflC
 EqBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVxWLq0/nCeb2VlFvX52XfC2B71J/Mtg385WDNgHseKL+zBrUXTMDi2Ctg6h++CNdxLL48KdT5PwM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWkRmWQRGuyUWf+9g8QbK5zkGb5Ae3MfV6OkK7LnLJg3J5uuaX
 pJVGWDTyXkDywpu4TYAXKMqMqE9Kpei+KNGaLR9gliKLiYhLrtRRArsCnglkygc=
X-Google-Smtp-Source: AGHT+IHKHTDFnByEuQrhxWvf5SouAIMF+9fOY83uMUNMpx5WQn1PycSxrrZARYgdc1+Bu9avy5zAFw==
X-Received: by 2002:a05:600c:4707:b0:426:5b21:97fa with SMTP id
 5b1f17b1804b1-42bb27a102cmr18206875e9.29.1724926675727; 
 Thu, 29 Aug 2024 03:17:55 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba6396700sm47212215e9.10.2024.08.29.03.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:17:55 -0700 (PDT)
Date: Thu, 29 Aug 2024 13:17:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Huan Yang <link@vivo.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 opensource.kernel@vivo.com, Huan Yang <link@vivo.com>
Subject: Re: [PATCH v4 4/5] udmabuf: udmabuf_create codestyle cleanup
Message-ID: <b9946356-3375-4817-92dd-baaf85802462@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822084342.1574914-5-link@vivo.com>
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

Hi Huan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Huan-Yang/udmabuf-direct-map-pfn-when-first-page-fault/20240826-105359
base:   6a7917c89f219f09b1d88d09f376000914a52763
patch link:    https://lore.kernel.org/r/20240822084342.1574914-5-link%40vivo.com
patch subject: [PATCH v4 4/5] udmabuf: udmabuf_create codestyle cleanup
config: x86_64-randconfig-161-20240829 (https://download.01.org/0day-ci/archive/20240829/202408291101.WAf552sW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408291101.WAf552sW-lkp@intel.com/

smatch warnings:
drivers/dma-buf/udmabuf.c:467 udmabuf_create() error: double free of 'folios'

vim +/folios +467 drivers/dma-buf/udmabuf.c

c1bbed66899726 Gurchetan Singh 2019-12-02  396  static long udmabuf_create(struct miscdevice *device,
c1bbed66899726 Gurchetan Singh 2019-12-02  397  			   struct udmabuf_create_list *head,
c1bbed66899726 Gurchetan Singh 2019-12-02  398  			   struct udmabuf_create_item *list)
fbb0de79507819 Gerd Hoffmann   2018-08-27  399  {
fb2c508270085b Huan Yang       2024-08-22  400  	pgoff_t pgcnt = 0, pglimit, max_ipgcnt = 0;
fb2c508270085b Huan Yang       2024-08-22  401  	long ret = -EINVAL;
fbb0de79507819 Gerd Hoffmann   2018-08-27  402  	struct udmabuf *ubuf;
fb2c508270085b Huan Yang       2024-08-22  403  	struct folio **folios = NULL;
fb2c508270085b Huan Yang       2024-08-22  404  	u32 i, flags;
fbb0de79507819 Gerd Hoffmann   2018-08-27  405  
33f35429fc49c0 Gerd Hoffmann   2018-09-11  406  	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
fbb0de79507819 Gerd Hoffmann   2018-08-27  407  	if (!ubuf)
fbb0de79507819 Gerd Hoffmann   2018-08-27  408  		return -ENOMEM;
fbb0de79507819 Gerd Hoffmann   2018-08-27  409  
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  410  	INIT_LIST_HEAD(&ubuf->unpin_list);
dc4716d75154b3 Gerd Hoffmann   2018-09-11  411  	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann   2018-08-27  412  	for (i = 0; i < head->count; i++) {
fb2c508270085b Huan Yang       2024-08-22  413  		pgoff_t itempgcnt;
fb2c508270085b Huan Yang       2024-08-22  414  
fb2c508270085b Huan Yang       2024-08-22  415  		if (!PAGE_ALIGNED(list[i].offset))
0d17455ca85ecb Gerd Hoffmann   2018-09-11  416  			goto err;
fb2c508270085b Huan Yang       2024-08-22  417  		if (!PAGE_ALIGNED(list[i].size))
0d17455ca85ecb Gerd Hoffmann   2018-09-11  418  			goto err;
fb2c508270085b Huan Yang       2024-08-22  419  
fb2c508270085b Huan Yang       2024-08-22  420  		itempgcnt = list[i].size >> PAGE_SHIFT;
fb2c508270085b Huan Yang       2024-08-22  421  		pgcnt += itempgcnt;
fb2c508270085b Huan Yang       2024-08-22  422  
fb2c508270085b Huan Yang       2024-08-22  423  		if (pgcnt > pglimit)
0d17455ca85ecb Gerd Hoffmann   2018-09-11  424  			goto err;
fb2c508270085b Huan Yang       2024-08-22  425  
fb2c508270085b Huan Yang       2024-08-22  426  		max_ipgcnt = max_t(unsigned long, itempgcnt, max_ipgcnt);
fbb0de79507819 Gerd Hoffmann   2018-08-27  427  	}
2b6dd600dd7257 Pavel Skripkin  2021-12-30  428  
fb2c508270085b Huan Yang       2024-08-22  429  	if (!pgcnt)
2b6dd600dd7257 Pavel Skripkin  2021-12-30  430  		goto err;
2b6dd600dd7257 Pavel Skripkin  2021-12-30  431  
fb2c508270085b Huan Yang       2024-08-22  432  	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
fbb0de79507819 Gerd Hoffmann   2018-08-27  433  				      GFP_KERNEL);
5e72b2b41a21e5 Vivek Kasireddy 2024-06-23  434  	if (!ubuf->folios) {
fbb0de79507819 Gerd Hoffmann   2018-08-27  435  		ret = -ENOMEM;
0d17455ca85ecb Gerd Hoffmann   2018-09-11  436  		goto err;
fbb0de79507819 Gerd Hoffmann   2018-08-27  437  	}
fb2c508270085b Huan Yang       2024-08-22  438  
fb2c508270085b Huan Yang       2024-08-22  439  	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
0c8b91ef5100ea Vivek Kasireddy 2024-06-23  440  	if (!ubuf->offsets) {
0c8b91ef5100ea Vivek Kasireddy 2024-06-23  441  		ret = -ENOMEM;
0c8b91ef5100ea Vivek Kasireddy 2024-06-23  442  		goto err;
0c8b91ef5100ea Vivek Kasireddy 2024-06-23  443  	}
fbb0de79507819 Gerd Hoffmann   2018-08-27  444  
fb2c508270085b Huan Yang       2024-08-22  445  	folios = kvmalloc_array(max_ipgcnt, sizeof(*folios), GFP_KERNEL);
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  446  	if (!folios) {
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  447  		ret = -ENOMEM;
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  448  		goto err;
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  449  	}
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  450  
fb2c508270085b Huan Yang       2024-08-22  451  	for (i = 0; i < head->count; i++) {
fb2c508270085b Huan Yang       2024-08-22  452  		ret = __udmabuf_pin_list_folios(&list[i], ubuf, folios);

There is a kfree(folios) hidden inside this function.  It doesn't belong there.

fb2c508270085b Huan Yang       2024-08-22  453  		if (ret)
0d17455ca85ecb Gerd Hoffmann   2018-09-11  454  			goto err;
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  455  	}
452dc1b0221804 Huan Yang       2024-08-22  456  	kvfree(folios);
                                                        ^^^^^^^^^^^^^^
A second free

fbb0de79507819 Gerd Hoffmann   2018-08-27  457  
5e72b2b41a21e5 Vivek Kasireddy 2024-06-23  458  	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
5e72b2b41a21e5 Vivek Kasireddy 2024-06-23  459  	ret = export_udmabuf(ubuf, device, flags);
5e72b2b41a21e5 Vivek Kasireddy 2024-06-23  460  	if (ret < 0)
0d17455ca85ecb Gerd Hoffmann   2018-09-11  461  		goto err;
                                                                ^^^^^^^^

fbb0de79507819 Gerd Hoffmann   2018-08-27  462  
5e72b2b41a21e5 Vivek Kasireddy 2024-06-23  463  	return ret;
fbb0de79507819 Gerd Hoffmann   2018-08-27  464  
0d17455ca85ecb Gerd Hoffmann   2018-09-11  465  err:
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  466  	unpin_all_folios(&ubuf->unpin_list);
fb2c508270085b Huan Yang       2024-08-22 @467  	kvfree(folios);
                                                        ^^^^^^^^^^^^^
Double free

452dc1b0221804 Huan Yang       2024-08-22  468  	kvfree(ubuf->offsets);
452dc1b0221804 Huan Yang       2024-08-22  469  	kvfree(ubuf->folios);
fbb0de79507819 Gerd Hoffmann   2018-08-27  470  	kfree(ubuf);
fbb0de79507819 Gerd Hoffmann   2018-08-27  471  	return ret;
fbb0de79507819 Gerd Hoffmann   2018-08-27  472  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

