Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7026AA04FD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 09:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08D010E2E8;
	Tue, 29 Apr 2025 07:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vxNQSkbe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D7A10E2E9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 07:50:59 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ace3b03c043so872336266b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745913058; x=1746517858; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4S3OVk3iZS4jTjecVJq5ncwg3Lfwh0WDUheLTONON4I=;
 b=vxNQSkbeqocM+eKEiRiqAlq1v+PQAPWBphpgXBNKtiVL3qbk2a6eyLTHT6uDus71Re
 oLJeH73aUNqEbt5Ut8hIMg6zcrm1EzOtncbIp7L/ZkLgDHbFhsiLdAq2qvYAwOyNwFPQ
 Jcu0i76DX5/b26XdkEnGvjJLRTtqp4jlefuuQorP6Fobmr5cOk8DIr9tkAu2MelMC4SZ
 az17zeEW+blyuF1LDDsv3ziZv8TeJ2kq000JAhPMOMpdPUEVnULYFiOnBYq3swWTiUVy
 WCpLELQjEazGCCMUJ0+vbsN0RAaUmgF6+aDc7UF+PFd1fevSHN+16u/KufxKIAK4lxLt
 fGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745913058; x=1746517858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4S3OVk3iZS4jTjecVJq5ncwg3Lfwh0WDUheLTONON4I=;
 b=Sje8La0dcCqmo9NFn59qgZAaw/H9677FZ0mixFmNLirQyywbSX/o1vaifmvRT34J2n
 GtDk+GfEwn1k/xHwiNZX0IpUJhlMSZFg4T7MMqdLIJZ9V/BPKg1cZQNjyX08cbNlbqtm
 2n+inasljdh1CAsiHYlsBaHFQDYR+DY0wXY9eYNt8XeCmfJIi7JMN3d/h4hbqP1738aF
 a8b3Ihw/T4EoRJFpHMgmmeoLu30V5MVGopurdmekan70HIzObnNx9klZ8/+/JpLVIHdP
 IlGq4KbBv5ckNJaYSHG/GPFlcJrf3P1lLx9hsOm8kqPWdYVtG5ToC4qixzczLBzeeLqb
 aQ9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBooQGSUZiQw8nxEbSTQqwxj98nf8nEizi5fF92xB/xPhEVV/1FqvYncyY3KBVTwN7h/VdGiHmcTo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlOs6dQqQqkZAG2Ovqwqh8wjGQN/JoVdEIFPL7X+fWNemuDjE/
 utgiwFbqel/oed9XrWntrr+fR0pYjToiSph+0PUuW/HCJZpbS9LTFuxyLl8poDY=
X-Gm-Gg: ASbGncvOeRFg98YnSoRwF1n/NCSxaJ83s9F8pl+ptN4zVxvAvBDAAlDpiVRUDsIcC6Y
 4iuoWbFsAi7SPqhjg84Ngc1c+2dq9TSvS0jFuylJWufTONZJOSfQpxIRfWsEkMkLSdj0tHyap9q
 +lJnyRnCZLEBYd3RscJUOjIgjzQG8YWp/ysG6gQ0KsSldinmvbMeETDy/c18J72KS0KwO/egpNx
 zQTyeMI14dxESyQF7a1CuIm03y2/fyTIhUoQA+iBHiLMOdY8XWKEu13sf96ci3EQlvZ7NNPhQYB
 9NC2ZF36B736uhteXIncEwWt0hu3z22wrGFPmw==
X-Google-Smtp-Source: AGHT+IETfUdZEy4CFxn1YEIQmSr6ySR3G/g5zLsPVQSq6DzfPUY0rl3GN75l8UgZGLkV0LGhqQnxFA==
X-Received: by 2002:a17:907:7f0f:b0:ac3:446d:142 with SMTP id
 a640c23a62f3a-acec84b8840mr173980866b.2.1745913057842; 
 Tue, 29 Apr 2025 00:50:57 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7035464e6sm6980176a12.64.2025.04.29.00.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 00:50:57 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:50:55 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aBCE3wSG2g5pp7jg@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBB-gl150GVaZPn5@hovoldconsulting.com>
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

On 25-04-29 09:23:46, Johan Hovold wrote:
> On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > > > > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > > > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > > > > to non-transparent mode to enable video output on X1E-based devices
> > > > > > that come with LTTPR on the motherboards. However, video would not work
> > > > > > if additional LTTPR(s) are present between sink and source, which is
> > > > > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > > > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> > > > >
> > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > adapters or docks with retimers in transparent mode?
> 
> > > > Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> > > > if it did work before, as I do not have a Qualcomm based device
> > > > without LTTPR on the baseboard.
> > > 
> > > Abel (or anyone else), do you have one of these docks that you could
> > > test with the X13s to confirm whether this series fixes a regression or
> > > not?
> > 
> > Before the support for LTTPRs has been merged, if you would have one of
> > those docks (I do not own one) with LTTPRs, link training would've just
> > failed if the LTTPRs were not by default in transparent mode, which IIRC
> > is what the standard dictates.
> 
> Ok, but my concern is if they may have worked in a default transparent
> mode.

But if they are by default in transparent mode, doing the setup to
transparent mode will not break it in any way. At least that is my
understanding of the standard. Also, I tested multiple writes to
transparent mode on CRD back when I wrote the LTTPR msm/dp patches and
doing multiple writes doesn't affect the link training that happens
after in any way.

I do not own such dock though to confirm 100%.

> 
> > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > would return 0 and none of the of the transparent/non-transparent setup
> > would happen.
> 
> But this is the crux; does any off-board LTTPRs in transparent mode add
> to the count or not? If they don't, how would you ever learn that there
> are any LTTPRs? If they do, it seems we may have a problem here.

Count gets increased either way. It doesn't matter if they are in
transparent mode or not.

If they are in transparent mode by default, link training will succeed.
No matter how many times the transparent mode is requested.

> 
> Johan
