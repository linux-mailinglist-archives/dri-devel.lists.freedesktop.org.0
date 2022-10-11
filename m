Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4A5FB767
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 17:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A8910E31D;
	Tue, 11 Oct 2022 15:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437BD10E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 15:34:42 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id i3so13831912pfk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 08:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E4TT5+XgfF+fVIz+vKOOCmhNChiCny6uMsCa8RIlVyY=;
 b=Pgenw8jmi7PqQSftPG+9DPKuF12f9wmISSReQ4ohtRCWKJ565YBXodNHYUzhltct3W
 3nFrgJsGXEWLfTAkIBvRUf/O3nna48ZcSh3YAz+Ajc0fpNS5T0XaT6lfn8kYkZWn6O/Z
 nzjnZvupeuF/QGn9Zolmw5a9m0d+EUzYbC15+NNNXBFszh4sdFoL0IQ+99iMly/6rcBb
 9YcDkjWuty+iTUidy773H0PVF9iQVSk/IMEtsLlqvntuEQvxGLAlHl58/iu/Fdmy6Kh1
 5slho+4PGXI4iPHB6/OyRaINtF9swY4KQqyqbNMFtxOYnYgDZfsZ97NNuH+ps8c7wV9m
 hlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4TT5+XgfF+fVIz+vKOOCmhNChiCny6uMsCa8RIlVyY=;
 b=vPxJEOEA9ee9I1dFaNzyIn6NCOwqTIG/jBKgD4HQEefj8sPVpC1j6hMoXAiucP4VzL
 SQ0t/FSBQT1qjL/Vn8B7L9enuk5ufdqeWDSGp0kpBOqgmgVXxYU1sQq7Tcb1bl2k53Qp
 rVBLviRgrzRSFiICLqwDEaJYMC32nvf9RDhsGVP4arK3a9J8T7e94mFqi/cY8X4yfim7
 Y83cttiS1XO4v2vMhgJib6lzKPcgYEHB9cMwXJDklsTUxeagkskIOKDVpropOjNh+4rs
 7WkGcZ2jRZaMzQqbWvz3UcKLS5agKX23egRpSw1nUF1SnmweZL7E0l9ESVadXkQ0LZr9
 90lA==
X-Gm-Message-State: ACrzQf2N6f2zS6dGwThh/fxlFjqxfRBCVQZEYhzuMr0Mo/7v1Lhqh6Ei
 2DIHuhLZ8A8D1bbgeWQeuy8=
X-Google-Smtp-Source: AMsMyM4nTQJFjN5qA0FQqZDYin3Y7HzdWXMAoAJ3QezkkZYNF6NziPpjcC42tZ3Bldu2o3VdJwVJNQ==
X-Received: by 2002:aa7:9212:0:b0:562:b5f6:f7d7 with SMTP id
 18-20020aa79212000000b00562b5f6f7d7mr25048626pfo.70.1665502481594; 
 Tue, 11 Oct 2022 08:34:41 -0700 (PDT)
Received: from ubuntu ([175.124.254.119]) by smtp.gmail.com with ESMTPSA id
 n5-20020a170902f60500b0017b5e1f486asm8737424plg.211.2022.10.11.08.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 08:34:41 -0700 (PDT)
Date: Tue, 11 Oct 2022 08:34:36 -0700
From: Hyunwoo Kim <imv4bel@gmail.com>
To: ChenXiaoSong <chenxiaosong2@huawei.com>
Subject: Re: Question about patch "fbdev: smscufx: Fix use-after-free in
 ufx_ops_open()"
Message-ID: <20221011153436.GA4446@ubuntu>
References: <363cdfe4-f54d-0ce4-2f03-bcfe998deeef@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <363cdfe4-f54d-0ce4-2f03-bcfe998deeef@huawei.com>
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
Cc: steve.glendinning@shawell.net, linux-fbdev@vger.kernel.org,
 yangerkun@huawei.com, dri-devel@lists.freedesktop.org, imv4bel@gmail.com,
 "zhangxiaoxu \(A\)" <zhangxiaoxu5@huawei.com>, deller@gmx.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 10:13:02PM +0800, ChenXiaoSong wrote:
> Hi Hyunwoo:
> 
> [patch "fbdev: smscufx: Fix use-after-free in ufx_ops_open()"](https://lore.kernel.org/all/20220925133243.GA383897@ubuntu/T/)
> fix [CVE-2022-41849](https://nvd.nist.gov/vuln/detail/CVE-2022-41849).
> 
> If the UAF scenarios is as follows, it seems that [fix path
> v3](https://lore.kernel.org/all/20220925133243.GA383897@ubuntu/T/) will not
> avoid race contidion of krefs:
> 
> ```
>           cpu0                       |        cpu1
> -------------------------------------|---------------------------------------------------
>  1. open()                           |
>     ufx_ops_open()                   |
> -------------------------------------|---------------------------------------------------
>                                      | 2. ufx_usb_disconnect()
>                                      |    dev->virtualized = true;
>                                      |    atomic_set()
>                                      |    usb_set_intfdata()
>                                      |
>                                      | 3. if (dev->fb_count == 0)
>                                      |    schedule_delayed_work()
>                                      |    kref_put()   <- kref count : 1
>                                      |    kref_put()   <- kref count : 0
>                                      |    ufx_free()
>                                      |    kfree(dev);
> -------------------------------------|---------------------------------------------------
>  4. if (dev->virtualized) <==== UAF  |
> ```

You are right. This v3 fix patch may prevent the UAF scenario I first suggested,
but not the one you suggested.

Any good ideas for this?
Could it be solved by adding a global flag variable indicating disconnected?


Regards,
Hyunwoo Kim.
