Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B2114E615
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 00:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FEB890F5;
	Thu, 30 Jan 2020 23:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE9E890F5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 23:22:14 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n18so5197510ljo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 15:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N4pLYntMtcNk/QyMGMKvQCVzanZck9/zOb6bpHQ9EQI=;
 b=lEUK2qdaPMJDOGemYqUp9+l4fajGrH26MZzmOmKwRvhVulg3P4yB7FGm+fA6xHcnrg
 OmXPbaTxjRxGqphgXuDAxKiaGbhzxCaDTGn97OlZq7rOx9jcXKvKCdoyz/YO6ZS2g0q9
 kXs8OHU0qWGY3g4TCy3W2+cPIeFpfxgBi6SDAHHl80nS84lSrexIGj4KNGslTtgiffAt
 +D3IK5MB7DpA/4XHDT+H/85GEnGIKw6/sYNOGpRdt7inkPPh0ke4RC70c0e5CI0YVTW+
 bfVb4lF5bkE7knJ75b1MSAyjvEu0RYRDrb0nHQIedvptCIfMDsVIOxxldh5PG1iTs2Vm
 sCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N4pLYntMtcNk/QyMGMKvQCVzanZck9/zOb6bpHQ9EQI=;
 b=K/xYnA+2T8GH2/57Yp52giTJinGd8JmBykGUOBRDaXwNUCl+NlEI+w1KjdNBDfClrF
 uWetpglyF9j7C7Kl0vbvHDGsnvm2p7JFTze1n2RE34pFmAPky/K8ap5smnMSzSWxHHHH
 D8CL8IvtJQBfNaZWmeScezW8svLcBCb8RDIDGRMp+CV8dGZyc8On9ItlFyJTTmVB4e2o
 pp9em6Tc0X+0QUI3c8X3Bgju3dtJrzWeaGzugFk4pppFIgxEOBUiy2rvSIwapM61YQ5C
 6J81rCndy6RI2+RTO+14037In7zJfRYMA676ujUgBAqfD+LE6vyhu75AwB1BYRNp6Oug
 9cew==
X-Gm-Message-State: APjAAAV9SfB6NJZWHJji7z23nJvZxoLdXBWNE8WP/GeZNpN/14RoSbve
 sa2AYhAb+txZKr+rHkagY0+jwInubrTU8q83xV0=
X-Google-Smtp-Source: APXvYqw/YlzAhwTZE6Giqw01b4YrMH0v8eLT4uWRQMvVdJUbTErJPFr5BqmT/vcBe29BoFwYiLzFDDqUJEBXR/set4g=
X-Received: by 2002:a05:651c:414:: with SMTP id
 20mr4056104lja.165.1580426532516; 
 Thu, 30 Jan 2020 15:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20191128135057.20020-1-benjamin.gaignard@st.com>
 <878snsvxzu.fsf@intel.com>
 <CA+M3ks5WvYoDLSrbvaGBbJg9+nnkX=xyCiD389QD8tSCdNqB+g@mail.gmail.com>
 <CA+M3ks4Y4LemFh=dQds91Z-LGJPK3vHKv=GeUNYHjNhdwz_m2g@mail.gmail.com>
 <CA+M3ks4yEBejzMoXPw_OK_LNP7ag5SNXZjvHqNeuZ8+9r2X-qw@mail.gmail.com>
 <b273036b10d8c2882800d01dcda7392e93b731fa.camel@redhat.com>
 <CA+M3ks5cuC5yJ-e0DCUiY1HtyyeU=mM9z56y4e_UduKaxcbw-A@mail.gmail.com>
 <08f4b69b1e48a81e90f28e7672da15cc5165969c.camel@redhat.com>
In-Reply-To: <08f4b69b1e48a81e90f28e7672da15cc5165969c.camel@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 31 Jan 2020 09:22:00 +1000
Message-ID: <CAPM=9txafoQNfMFf0Ff1SnBTgq6jYyvjJyjCSJua6-SJVVkScQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix W=1 warnings
To: Lyude Paul <lyude@redhat.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > >
> > > hi-actually yes, we should probably be using this instead of just dropping
> > > this. Also, I didn't write this code originally I just refactored a bunch
> > > of
> > > it - Dave Airlied is the original author, but the original version of this
> > > code was written ages ago. tbh, I think it's a safe bet to say that they
> > > probably did mean to use this but forgot to and no one noticed until now.
> >
> > Hi,
> >
> > Any clue about how to use crc value ? Does it have to be checked
> > against something else ?
> > If crc are not matching what should we do of the data copied just before ?
>
> We should be able to just take the CRC value from the sideband message and
> then generate our own CRC value using the sideband message contents, and check
> if the two are equal. If they aren't, something went wrong and we didn't
> receive the message properly.
>
> Now as to what we should do when we have CRC mismatches? That's a bit more
> difficult. If you have access to the DP MST spec, I suppose a place to start
> figuring that out would be checking if there's a way for us to request that a
> branch device resend whatever message it sent previously. If there isn't, I
> guess we should just print an error in dmesg (possibly with a hexdump of the
> failed message as well) and not forward the message to the driver. Not sure of
> any better way of handling it then that

Yeah I think this reflects what I wanted to do, I've no memory of a
retransmit option in the spec, but I've away from it for a while. But
we'd want to compare the CRC with what we got to make sure the are the
same.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
