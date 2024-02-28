Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C652686B335
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5237810EA08;
	Wed, 28 Feb 2024 15:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="aDbTGkrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183FA10EA06
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:35:01 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7c7c983157aso161793639f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 07:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709134500; x=1709739300;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iNAvgyIqsVv/a99B/1dg7WEzlEY9khThv7cRxR59TPU=;
 b=aDbTGkrNW4/YeCuvBqHX2IPLsaNtUmyFsl3I1Lw+6msjOQduFHjEkY9LEo3uYWVAxX
 I3b1uzIO7hH7S3MMyItdJN28kJ7Squz0gjg71JAJcyalrTnX6sOMsjWYK25BaMjRah/K
 /xqGS2bztrOCQt4s+2wFXAVwbfmvUPHUEahr3G2aEottciGC7HViLzyeg93uzOrXo5DM
 aFYIHAZlhgkdAMCM6iwYFvGTADQs9ovVDYnYgTN1jDcCQj7eClYBPtxfiQmfp+hVp2Is
 4l+5Ukydmjyb8/HKpwhrDvarEJZ/NzXcNl6tGW+0hp/U2td0JZYKohmkwgQZT5VLqYmi
 QBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709134500; x=1709739300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iNAvgyIqsVv/a99B/1dg7WEzlEY9khThv7cRxR59TPU=;
 b=QlI3xPKNPhNCXTmqXMkVlf5QW1D1jNE2NVESoqKz+kuTnAtaKSFmwVIaX+uEHLsONa
 szz02c+zGSLRD48XzxKPEVZqR3CgQTCD5mmV3NGxtDro0TAOf/VAmVX/wOetH5QZhla+
 LZ2jF+zN2w/0StcG0mUM9FWZEWeWWyxt3/YUFccd3ASZINJoAj2cNct/vyl0wcZRAwgD
 zB+ww7e4ywJ1wZCtWDFatx8hPcHLRTWiFyS04lFvvh7iMJ1ERAWnOdsA5rA3IH7cci3U
 5v18Ni7/zsUsKMBjD1YXzhb8wcKz73dP+nZGx+qH4RT8AnntuxNZFmJNIjOi4J/TGMfz
 IT/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1iRU2sHsifynmFGeOF8z/p0j5nSHz+W7AWcTDqyb7Ny5InSCbnWv/gHZBSYiPkqhRmOgzqf68CnjWVsv14QlJeMhUgV1sKomQW9+m5ah/
X-Gm-Message-State: AOJu0YwXXWrPn5RJv9MgQfH6qm+WOF+8aIFWFbKcp7Av/kXi8UPZxQjM
 y54YWwgYDNK3QELAxHbpVL6Tk74Kk37vNkqFXtYpE0osj8jvvdsKaKE+4Up6WikvsCid2On6OoN
 pecW4r0qrSwzYdXqufx1wbrTPoV3fbj21RgQM
X-Google-Smtp-Source: AGHT+IEeVN3q9xNzpReeRZxijH7C6wt2a9IrbXxLntCsmJH6YSq6dIRXQNoD0I6sxRdNJtvS6Sw8zAyHk4q5Fcirhqk=
X-Received: by 2002:a6b:5a02:0:b0:7c7:b9bc:26ed with SMTP id
 o2-20020a6b5a02000000b007c7b9bc26edmr12066971iob.11.1709134500112; Wed, 28
 Feb 2024 07:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-2-panikiel@google.com>
 <ce262cda-84ba-4d8f-a916-76488c94066d@xs4all.nl>
In-Reply-To: <ce262cda-84ba-4d8f-a916-76488c94066d@xs4all.nl>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Wed, 28 Feb 2024 16:34:49 +0100
Message-ID: <CAM5zL5qrMNfyiXMOJHUzLySm_U2U8kbD=D_Cyn0WjkvpikiYpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] media: v4l2-subdev: Add a pad variant of
 .query_dv_timings()
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org, 
 robh+dt@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
 ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Feb 28, 2024 at 12:25=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4al=
l.nl> wrote:
>
> Hi Pawe=C5=82,
>
> On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> > Currently, .query_dv_timings() is defined as a video callback without
> > a pad argument. This is a problem if the subdevice can have different
> > dv timings for each pad (e.g. a DisplayPort receiver with multiple
> > virtual channels).
> >
> > To solve this, add a pad variant of this callback which includes
> > the pad number as an argument.
>
> So now we have two query_dv_timings ops: one for video ops, and one
> for pad ops. That's not very maintainable. I would suggest switching
> all current users of the video op over to the pad op.

I agree it would be better if there was only one. However, I have some conc=
erns:
1. Isn't there a problem with backwards compatibility? For example, an
out-of-tree driver is likely to use this callback, which would break.
I'm asking because I'm not familiar with how such API changes are
handled.
2. If I do switch all current users to the pad op, I can't test those
changes. Isn't that a problem?
3. Would I need to get ACK from all the driver maintainers?
