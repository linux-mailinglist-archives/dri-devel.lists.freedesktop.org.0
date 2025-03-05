Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D850A500F2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6616710E765;
	Wed,  5 Mar 2025 13:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DXEvh2M5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B73410E765
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:46:03 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-223785beedfso88690185ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 05:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741182363; x=1741787163; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/px/S3IqWhEUcWqSxL2Jl4SMrtR12fYNolH67/5Znm8=;
 b=DXEvh2M5FKR862Cn1v1cWmlss24bNSpj2DExysJ+ribo0Mf7jWKxsBf4GoS3CFKLsG
 0ZrCtvVwvlSheEzAV2go04UmR8K+Pb9Y4Ki7Cplclyemak8uo6fgaU9S53P3R6lWSk43
 LUvyfPuwX83J1o98TpVX0oWUWi9ENu33nOD0WcDopUIi/lC/nxF/Jb9JLxR6cAfyAvfn
 0dudoWuMwX6vHOI/ocgpS6CLBkpw9fmrLARmG45tg7PY0oNRvA304nFnX40Pzm2I5pgv
 5xWQ94pyqovOu3KqMISsr+e0jfio29YDOa4A5DBoKyQNl9BW2zYvUA3c+KqvqVXzWXHH
 L7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741182363; x=1741787163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/px/S3IqWhEUcWqSxL2Jl4SMrtR12fYNolH67/5Znm8=;
 b=EL0lOn2ahyC05j+CBAYrZKAIt8UX9ljkRxnerFepHHcjMYAztuxLxtDilMZD0G97mn
 R97s411CvBjBN4x+9j5aW8Az8DI1yOsdfwvsw0jV90yoeP3g9+F9bv8HG8q3aRBpYzmk
 +XeBx1KAo8OvOSRPRk6qFZjligi+dgRk/UCIMmfmBuD6m1jHo8jSS30BloeMVVk0K34V
 oZH6DFW2hqezv0gr8hAhOVIPUKoWExJf9kPXSeJMlOEQihVhfVoAwgrdx7fdAAs3uWLh
 GHvrLyVU7VnXQDBO88VFGdAlPkH3i8YdCHDMWbZrG7G8tzdNdX1FrKIvAupuq/1mJ93E
 kHTA==
X-Gm-Message-State: AOJu0Yxl1g/ZEjJFCj3rBrCLuk4GMK+cnV0m+8+tDFBV+goIsGMQ61k5
 xBlizQUCPRisW0hnDSrv7L5mP56cnEw9fUqZfMPzgZt9paP9jaCZ
X-Gm-Gg: ASbGncvZJsPP71tytB67m+g2+BjdVHYPTVt+ozsrXBV3OZsua+G2IsITA0Br1elsr3e
 3u+aHj/MTR42Oo4hSAkNgtSrSPjVYfxn2K/s6ZakoMzgmEXvB2y0ARwhPlq6SDbCxprn/nJwVLG
 /ELnlPezPypb4BP/1DkJjk43+CTul3C8gagmV/zFC9iOVDdjEhnSmOHmpvBNTRBJMNrf4sXqxq3
 WlikTQA8V2n64rXDtYyDM5K27cN3z35Wh3tM9+fA2CaJZ+pe1z1JqQtodsD++JVIfuIDnwYOUl3
 QbtoWZlSS0eASjybk81gQPPeqNI11OIZUHmqBnrJ4S8S
X-Google-Smtp-Source: AGHT+IGYSUjtH3sedYuRr0u5NHMtfZcmcEghWFQ4LPcIqufsg11z0toJ1auh2reLKGU+Shpwkqnd/w==
X-Received: by 2002:a05:6a20:6a0a:b0:1ee:ad21:e692 with SMTP id
 adf61e73a8af0-1f34951be84mr7283636637.32.1741182362949; 
 Wed, 05 Mar 2025 05:46:02 -0800 (PST)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af021fb1581sm9620914a12.36.2025.03.05.05.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 05:46:01 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 0546E451AB7A; Wed, 05 Mar 2025 20:45:57 +0700 (WIB)
Date: Wed, 5 Mar 2025 20:45:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] drm/sched: Adjust outdated docu for run_job()
Message-ID: <Z8hVlc0AgQkNqSGL@archie.me>
References: <20250305130551.136682-2-phasta@kernel.org>
 <20250305130551.136682-3-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BAmTh8OS1ScbKhPJ"
Content-Disposition: inline
In-Reply-To: <20250305130551.136682-3-phasta@kernel.org>
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


--BAmTh8OS1ScbKhPJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 02:05:50PM +0100, Philipp Stanner wrote:
>  	/**
> -         * @run_job: Called to execute the job once all of the dependenc=
ies
> -         * have been resolved.  This may be called multiple times, if
> -	 * timedout_job() has happened and drm_sched_job_recovery()
> -	 * decides to try it again.
> +	 * @run_job: Called to execute the job once all of the dependencies
> +	 * have been resolved.
> +	 *
> +	 * @sched_job: the job to run
> +	 *
> +	 * The deprecated drm_sched_resubmit_jobs() (called by &struct
> +	 * drm_sched_backend_ops.timedout_job) can invoke this again with the
> +	 * same parameters. Using this is discouraged because it violates
> +	 * dma_fence rules, notably dma_fence_init() has to be called on
> +	 * already initialized fences for a second time. Moreover, this is
> +	 * dangerous because attempts to allocate memory might deadlock with
> +	 * memory management code waiting for the reset to complete.
> +	 *
> +	 * TODO: Document what drivers should do / use instead.

No replacement? Or bespoke/roll-your-own functionality as a must?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--BAmTh8OS1ScbKhPJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ8hViwAKCRD2uYlJVVFO
o/7CAP9JYkL53h8JRbqf79JQDnecBuTAl51o0C19e9U8AzZdGQD+O21VSfvdkdU4
9Ai00GB7ztnSU4Rg80+OXXOZhFux2Qo=
=F7NO
-----END PGP SIGNATURE-----

--BAmTh8OS1ScbKhPJ--
