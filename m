Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D59746E14
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 11:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD98210E2BA;
	Tue,  4 Jul 2023 09:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A905D10E2BA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 09:58:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-307d20548adso5970116f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688464699; x=1691056699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YWyUoPaOombeDrDWZBro8KQ+sR0XnbUpjVH++v65VYo=;
 b=miOdESdy2upBwJi/t8/9qqu/dkeEELTNZ3bF6CZbiBvztc9y0eI5dibE45S4tCsOoX
 bWHmp4/+ujj1P9jpWEV27ur5ws90hITIACrErTnmfOikfEBl0uVG5hu/whxrRCdFcrhu
 25ULhzi5M809zrks2cC/xsWaoBshiyunYHP2+49/AgSxU88WUjcgTWUepNPQOZc9eK5z
 kMN+XXwqDnd45zIce2w1RQ9+VzOBmJ84ewv+w9BzWh4+Q8XcqmrrUqdhtUYROBeGfKkM
 xHNPPU107Vehc/YamzJ7nFi4hp82EYoWzqgZXVkCpASpsJkWgM+DSK7JSk9qiloHSCv+
 ljkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688464699; x=1691056699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YWyUoPaOombeDrDWZBro8KQ+sR0XnbUpjVH++v65VYo=;
 b=MkKDS5R0PlhmQtS9VDN8W2EVoDLuonDwk5EXCI/KD9G28bXWLtF0BI5KZRXLwxthZw
 WtYpla6+f2rcsO6PyQdJJm+bkat946uTcB4/U2/PkULI+7mNErmpwlrEHpVVe628IWcn
 Ab3WmdGFBOHa27B1swd/vBjt9zgJJOjFnSUyZDisHQoUX9rI/pJmJj2vFBOEPHUDkWnf
 3XB7rCzFaqyfI8d0AtqR9vpubISjDS/098689UEGNx1NMI7Qb83vDwVufnKSON/lknJQ
 B/KcdnQcZl8hb+p1LNyL8yqVdF0bueSqlpN5C8iMe7X04xdx9J5o0dop/P5zfdhFSBXB
 FkSA==
X-Gm-Message-State: ABy/qLYk4D3VeU1KHegXNlGzggq4XjxkLST8M/otx9pAY8CtPV0RSTyj
 8gSWVgab4OJ4pBJV4I8APIootg==
X-Google-Smtp-Source: APBJJlE5h6ah7q6vVL8qs9Ryg73a6WzNmZFOoQP7/aN2lxWhBCakmkzm/hyl9y8mBLJ9Egn72dyPcw==
X-Received: by 2002:a5d:4e88:0:b0:314:228:c769 with SMTP id
 e8-20020a5d4e88000000b003140228c769mr9757694wru.44.1688464698816; 
 Tue, 04 Jul 2023 02:58:18 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 c13-20020adfe74d000000b0030ae499da59sm12838791wrn.111.2023.07.04.02.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 02:58:16 -0700 (PDT)
Date: Tue, 4 Jul 2023 12:58:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <b1f8ccdf-144a-4156-af13-9d5731c5ab83@kadam.mountain>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
 <1d79cddc-0afb-08c2-8aac-8f3b7761d210@quicinc.com>
 <fb5f0a0c-c46f-4eec-bfcc-50b4be44c0a7@kadam.mountain>
 <eadc6f73-0fbf-80a0-cd1f-84f7fd51f6d7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eadc6f73-0fbf-80a0-cd1f-84f7fd51f6d7@quicinc.com>
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

On Tue, Jul 04, 2023 at 03:18:26PM +0530, Pranjal Ramajor Asha Kanojiya wrote:
> 
> 
> On 7/4/2023 2:08 PM, Dan Carpenter wrote:
> > On Tue, Jul 04, 2023 at 11:57:51AM +0530, Pranjal Ramajor Asha Kanojiya wrote:
> > > > diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> > > > index 5c57f7b4494e..a51b1594dcfa 100644
> > > > --- a/drivers/accel/qaic/qaic_control.c
> > > > +++ b/drivers/accel/qaic/qaic_control.c
> > > > @@ -748,7 +748,8 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
> > > >    	int ret;
> > > >    	int i;
> > > > -	if (!user_msg->count) {
> > > > +	if (!user_msg->count ||
> > > > +	    user_msg->len < sizeof(*trans_hdr)) {
> > > >    		ret = -EINVAL;
> > > >    		goto out;
> > > >    	}
> > > > @@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
> > > >    	}
> > > >    	for (i = 0; i < user_msg->count; ++i) {
> > > > -		if (user_len >= user_msg->len) {
> > > > +		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
> > > If I understand correctly this check is added to verify if we are left with
> > > trans_hdr size of data. In that case '>' comparison operator should be used.
> > 
> > That was there in the original code and I thought about changing it but
> > I don't like changing things which aren't necessary and == is also
> > invalid so I decided to leave it.
> > 
> I see, I understand your concern about not changing unnecessary things but
> '>=' is incorrect for reason mentioned above. We need to change that to '>'

Oh, yes.  You're right.  I will need to resend.

regards,
dan carpenter

