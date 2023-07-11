Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8ED74E724
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E1C10E313;
	Tue, 11 Jul 2023 06:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DC010E313
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 06:22:34 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82de7so38023145e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 23:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689056552; x=1691648552;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zU1H95+JdGa0jLKaOOBSIowzO/e5Eobe9bWmmv0ie58=;
 b=mCwwQh58+I6Vg1tWHZXgWb1BDWqLVOuhY7rprGezPQXcAgvpFycJaGnvK3NGUWCDoQ
 ytVTghV/qznmFMwVx/3zgIC4ZtTlEWb5AiKLLYfsGCFtw/uVArS8+KwWxEO9LzB0Jd4d
 1xOYUT6To1Iji9qHRike1ZnsHJEKWSbFeJtektcZm+KopE0l5cn3Uw6MaXkaKoTlJ3v0
 LQFN6V8PKLvhM4hXioTtZKXyvFdGzEPmqutoSPSoL7Ka47h+LhowR1+E/NI80O/zcYSA
 9hBvHtgT+ekDu22Zgpc0LYkr7w2KrJThweBfgsLRRbDZkc3xZmFAwFnQxyCNqHHoZxiC
 oUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689056552; x=1691648552;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zU1H95+JdGa0jLKaOOBSIowzO/e5Eobe9bWmmv0ie58=;
 b=CuC6TBViM03sjhiZLqw/JoCFoHNXlqvI6MuRO0Ik99tfV7rEmkh7yjthwMdp4bI1bl
 f9MZPSLF8PsZmVLy+huA54amf8H0Yub6KG/SUTAsAQh6R3HYLNJMtKDc3NO3xpeMqkKb
 9bZkGiCCTJHEBOrA4pJCR62Nz3G9IYdMMlk9F8GbDBFaTfee4cjM72/snMdhQdWsRBow
 kKA0VackT0L3OsRlhEeSMtkYR+nfZNdIt+Sr/cAue2+qvy7cx/Ak4HTHf9DaGdu8Hqmc
 D5IDjcq6l/ItH5dxWmy313SRjWnnS8c3H3B3OkqCn0Qq4wyXidxXNqkDPJ/tSQAgrecF
 QXzQ==
X-Gm-Message-State: ABy/qLaByDlIQEOMLzJr02IK5QmIAuYMHzTMauvEyPV7LrzNrdCzJ0g6
 WxfOGbcfyEaAkkLJZGROGFF5iQ==
X-Google-Smtp-Source: APBJJlGHAqGinu5QiM0MBt8JJ7Qkz0GLqDgkZt5uCZPsLKj+wgA2Y0+e1RzUBir6Dr0MAbYmFbvaBw==
X-Received: by 2002:a1c:770b:0:b0:3f7:c92:57a0 with SMTP id
 t11-20020a1c770b000000b003f70c9257a0mr13580551wmi.14.1689056552667; 
 Mon, 10 Jul 2023 23:22:32 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 s21-20020a7bc395000000b003fbc89af035sm1566982wmj.17.2023.07.10.23.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 23:22:31 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:20:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 1/5 v3] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <a40baccf-2b9f-4a20-a353-8e470fc5b45c@kadam.mountain>
References: <ZKzx5nA6Z/0yhBJj@moroto>
 <ZKzyXx0z1gWDDJII@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzyXx0z1gWDDJII@moroto>
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NAK.

Wow.  I really screwed this up.  I didn't mean to send this patch.  I
have a correct patch still sitting in my postponed messages.

I will send v4 in twenty minutes.

regards,
dan carpenter

