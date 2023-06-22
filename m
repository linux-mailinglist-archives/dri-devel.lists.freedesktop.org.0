Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A073A01D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 13:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5832C10E54E;
	Thu, 22 Jun 2023 11:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA9710E54E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 11:54:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3112d202363so5472390f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687434852; x=1690026852;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NEDzw9W907hEJwOxTJsGWFRFwCq3nRuMhD+n/fKGN60=;
 b=tK0/+K+m7/3eGhBv23aqBH5Gs2tZsqkyup99w+atiRRAqfT1ZbcbNIfmNz2yyQgh0W
 Rsj7HCR9tf2kbkvLlN4JX6KsZw7zVPNuG+By3hvLRWsWjzCjl5h3sk091vuxmFZUXVRH
 puBRfu0R1iMZqK9fW6MEm+OOkQ/PvqbMtcztaw0yThqtd5NDJa7lWMo54P8E2RS6XY0N
 S/0d9bwhNU79TcNwR/+jdiHDVXpHmI+DSbfjdbf0Ixu3cK0vZnnI2atq3Wjh1eOSQw/5
 7iGMeI3lQD6lBXGVu99OAr5OV+HmAr4b6LGufZh1LrCdtLnOdob9Nk5Dz3SySVjiEHza
 I19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687434852; x=1690026852;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEDzw9W907hEJwOxTJsGWFRFwCq3nRuMhD+n/fKGN60=;
 b=duYn2hr7TAUjgq5M5u6sDI2uTNWGYz9OyEsMvj+ox5hCfUWCNbFZdIFh0uCW++iyvo
 0qwlFSv3BJADcyDvS69VrQhCukXcmEKVHESwZv5yuCYL7S6MP3g8wpwvfP9Xe17NJUXO
 UlD7of7Ih6YLcwU/+/ODK+aBLe4cPV2fAJKNHWoDY4ez5+1ZOCcPD98EPs4Pz3XHya5i
 4FpboW1XhJC1rX8rQCcIetaVeg/mTJZyTjYIoDmovj2YBfDUX9+AGr4wSy8rR/bXQxHr
 7mWpN5fEVz1DPsxQhU6m2Lp5QRyZlq8kODoZQJhmx2oJnroLl4sQS+AlOgTQa8W/c9eJ
 FXzw==
X-Gm-Message-State: AC+VfDx7LSQqOvqKbtNckkxwDUXs4OUAFWw1qRJoVNUj/JICKA1IMeQH
 rS7JrW9/yuvNlRK/FNxnkWEyuA==
X-Google-Smtp-Source: ACHHUZ70D+J1QTacDXVqJOA4np0FJzeoEIPAcFhEXdbIZuDpiUcntI3PDgpYZPBt69zEoGYZZ+6soQ==
X-Received: by 2002:a5d:5342:0:b0:30a:c2c4:7133 with SMTP id
 t2-20020a5d5342000000b0030ac2c47133mr13950349wrv.49.1687434852543; 
 Thu, 22 Jun 2023 04:54:12 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 x14-20020adfec0e000000b0030aee3da084sm6870368wrn.49.2023.06.22.04.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 04:54:10 -0700 (PDT)
Date: Thu, 22 Jun 2023 14:54:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <1bf6a1b7-387c-4b39-a7b1-baa8eab7c1c2@kadam.mountain>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
 <95ed2c6b-df33-a252-8eba-3cb848c5c40b@quicinc.com>
 <225a7da6-f0fc-41d1-8bbc-6247a4733731@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <225a7da6-f0fc-41d1-8bbc-6247a4733731@kadam.mountain>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 22, 2023 at 02:43:57PM +0300, Dan Carpenter wrote:
> > > -	if (!user_msg->count) {
> > > +	if (!user_msg->count ||
> > > +	    user_msg->len < sizeof(*trans_hdr)) {
> > Can we have something like this here
> > user_msg->len < sizeof(*trans_hdr) * user_msg->count, no?
> 
> This check was just to ensure that we have space for one header so that
> the "user_msg->len - sizeof(*trans_hdr)" subtraction doesn't overflow.
> We're going to need to check that we have space for each header later
> anyway.  Can the multiply fail (on 32bit)?

s/fail/integer overflow/.  Obviously failure is not an option when it
comes to multiplies.

regards,
dan carpenter

