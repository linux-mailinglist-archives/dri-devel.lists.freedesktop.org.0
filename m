Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD47C9E2E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 06:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8CE10E085;
	Mon, 16 Oct 2023 04:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5279910E085
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 04:24:32 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5a7af45084eso52311597b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Oct 2023 21:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697430271; x=1698035071; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=doJNqYYY+UAgVxcOFGnsMmSNVdk7OOtFphnalZHhULI=;
 b=MKIhZQcwZI3SqxycXZuY/RUUmwyf+HcPzevxFhNbgL31H61O/jAinaf++c+hytFQSk
 Jckk6omVyeQYJ4D7eM1s2ECYnmVaz2erpWMqHuoZGXvSN1HA+HSW6o/xXS/nFnSG31Xk
 IR2M4oU9GnS2h9WWMdX8EYHydivpyIYwCmeGfOHZExWo9JA1iZLFWw2bYSsikVGJyiN4
 AEHXolO8dNO18lqzBKVfpumMex82qx+2789Rh0s1tBqdQLe26s1QBVVQy8BQwzv0Rs3/
 0vpnKMFNx4C17uOr1uZLz2AXUHVhZu5jsWwLhPNOAqb4XzGPfXL5a/B3WpV4AGizmXqe
 L0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697430271; x=1698035071;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=doJNqYYY+UAgVxcOFGnsMmSNVdk7OOtFphnalZHhULI=;
 b=JYco/lkEEZxCZicETVdj6fDLt/VyH7L7MTx7R7KN84sLdERnpOD1d2z5ghp3Iu5qD8
 2+AorO96iDKdzU7TWGE7AeA+v/eRLDlaN8vkPCQnBrKC8aHt7U0kGju05tW04tjg+EuO
 PRSHYJrwx6clLdnHoXIRYZH0z7s3LcV7KZOsbZuGE5SsuI1/iwJccE9C/JdIdDzCtu2b
 pvpJZf6uamIS3CMJQWdBr856OQ8pjNSp9w3FCQYJVqPs+bWp1kISmhpf4hSJ3AH4umUR
 oL2ToaQjiMIHcDOB5+4od5eqxTtlReRlOEMtIzSTcbPK795wN4E31usEc+EQICqt84LX
 LUvg==
X-Gm-Message-State: AOJu0Yx8VNB1Zj41DHIyOhFYrzi4iQTtgDKfUxK7UpNLCJnNiOGRCVJd
 9KsNZo9GsrWdUbDjn4y7rxxRc/cPZDwQs8XY8jmjR+nVJcs=
X-Google-Smtp-Source: AGHT+IGkdrqkW+CvTEXc2PXnPQ5J+nq4/duylxOZapdVuRaOAGeQlRCZPMnmhQHIBMe0O7nZpGaR7PvVJC2Ouw9PDrg=
X-Received: by 2002:a0d:c787:0:b0:59f:7fb9:621a with SMTP id
 j129-20020a0dc787000000b0059f7fb9621amr34467329ywd.22.1697430271105; Sun, 15
 Oct 2023 21:24:31 -0700 (PDT)
MIME-Version: 1.0
From: chalil jitesh <chaliljitesh@gmail.com>
Date: Mon, 16 Oct 2023 09:54:20 +0530
Message-ID: <CAP8JTabwbref_6fRirxJTuyscozeKALm30qj+6JnVTk0ddwyLg@mail.gmail.com>
Subject: Request for information on generating DisplayPort error packets for
 testing
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000571fd60607cdc8c8"
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

--000000000000571fd60607cdc8c8
Content-Type: text/plain; charset="UTF-8"

Hi,

For testing we wanted to generate and send some error DisplayPort frames
packets (send some invalid DisplayPort video stream data packets) to the
DisplayPort sink device to check if the sink device is behaving correctly
to DisplayPort error stream data frames received.
Could you please suggest any drm/kms tools in linux which can be used for
creating DisplayPort error packets for testing.
Could you also please tell us we can modify the drm driver apis to corrupt
the DisplayPort stream data packets which are sent by drm driver to the
Displayport Sink Device.
Kindly please suggest how we can generate error Displayport stream data
packets for testing from DRM drivers.

With Thanks and Regards
Jitesh

--000000000000571fd60607cdc8c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>For testing we=
 wanted to generate and send some error DisplayPort=C2=A0frames packets (se=
nd some invalid DisplayPort video stream data packets) to the DisplayPort=
=C2=A0sink device to check if the sink device is behaving correctly to Disp=
layPort=C2=A0error stream data frames received.</div><div>Could you please =
suggest any drm/kms tools in linux which can be used for creating DisplayPo=
rt error packets for testing.</div><div>Could you also please tell us we ca=
n modify the drm driver apis to corrupt the DisplayPort stream data packets=
 which are sent by drm driver to the Displayport Sink Device.<br></div><div=
>Kindly please suggest how we can generate error Displayport stream data pa=
ckets for testing from DRM drivers.<br></div><div><br></div><div>With Thank=
s and Regards</div><div>Jitesh</div></div></div></div></div></div></div>

--000000000000571fd60607cdc8c8--
