Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E2A18DD0A
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 02:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E262E6E227;
	Sat, 21 Mar 2020 01:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011256E225
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 01:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584752584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfCJB1CUZ+VKC9xpB11jLdF74OwFkNnvn3bT5eqNN/Q=;
 b=N6SnpZr2gCJijORUQ8G6HzqzmBTcohNKWX4XUYNQl2L3LlCilRwXrpIrYRoh8NOU7X0Mg7
 z6sIGMTIgH1PlW5lf6Z85a6ZOqUkdkjjBcm1Mo9QZHUvMW9UAh4jqAdo0BiGr6Qqc0Mt5g
 zOomuj48T8oCbsOfr0JsSXESy36OMTc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-uSuUaZcSMO2rEsdRX00vOw-1; Fri, 20 Mar 2020 21:03:01 -0400
X-MC-Unique: uSuUaZcSMO2rEsdRX00vOw-1
Received: by mail-qv1-f71.google.com with SMTP id v88so7397978qvv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 18:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AjQuPaCjd7Ig4gpbwFISut+nUjzFUAzjw+os+HFJBP8=;
 b=PcGjbpuCq63fpuTPtJyf7zXQzM34W3rfVmaA/I3qwwXC1YqubQha4ILHx6+USaG/CD
 MQ/QZbj9153HE0gwwgOJJkaK40kMxJIUQjzjpqr6sDvNbPrMLJbzaeFplWVJx0zKbAxQ
 0MhoGsAA41aTPgoLV9epbqidgzcEDf+uQKrk/gmEcwIAD8mg5Vmu5es0qyG6s91GiJ3I
 pUKCq25buCoQ/k4bkynbtzxpS1mTy1DKIGvROcmrykJC/I4wUApLpsSmBhHH8iQUqinm
 V6DMEX1YN1g8hT1ee7WRWiIINsWG+BYIpifN3XetaGS1gWncjmG+3YzOJ5sK/V0aWNoo
 ZrfQ==
X-Gm-Message-State: ANhLgQ0CgzLzNwiOZKEPXUFihp9UNZCvjRlc12e7Ok74KIxH+L5FxPFz
 m0pszOBGUCRFkbf4SfPJaJt5CveoMtgiUi/F65Yg8v3+J8gI8Pb6SDaK28n+vJnd1+WPZweZ5RY
 Qc1uPaI81r2QTvpcRUxFVwFQxC/knz4bGBh2h5kcArYEm
X-Received: by 2002:a37:9f42:: with SMTP id i63mr11208508qke.192.1584752581297; 
 Fri, 20 Mar 2020 18:03:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtCh2wJtD/g8xto3BH0cPBIK4C3l4y4LBkjZ5hI622fvjzhRRZrgbDgis1CB+9R05hCeHqJZDHrFD188Ry1ESA=
X-Received: by 2002:a37:9f42:: with SMTP id i63mr11208481qke.192.1584752580926; 
 Fri, 20 Mar 2020 18:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200310192627.437947-1-kherbst@redhat.com>
 <20200320221931.GA23783@google.com>
In-Reply-To: <20200320221931.GA23783@google.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 21 Mar 2020 02:02:22 +0100
Message-ID: <CACO55tsamLG5WE16U=psJpRWfz=7Fy5K8haGKHnhic1h0WAmqA@mail.gmail.com>
Subject: Re: [PATCH v7] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 20, 2020 at 11:19 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, Mar 10, 2020 at 08:26:27PM +0100, Karol Herbst wrote:
> > Fixes the infamous 'runtime PM' bug many users are facing on Laptops with
> > Nvidia Pascal GPUs by skipping said PCI power state changes on the GPU.
> >
> > Depending on the used kernel there might be messages like those in demsg:
> >
> > "nouveau 0000:01:00.0: Refused to change power state, currently in D3"
> > "nouveau 0000:01:00.0: can't change power state from D3cold to D0 (config
> > space inaccessible)"
> > followed by backtraces of kernel crashes or timeouts within nouveau.
> >
> > It's still unkown why this issue exists, but this is a reliable workaround
> > and solves a very annoying issue for user having to choose between a
> > crashing kernel or higher power consumption of their Laptops.
>
> Thanks for the bugzilla link.  The bugzilla mentions lots of mailing
> list discussion.  Can you include links to some of that?
>
> IIUC this basically just turns off PCI power management for the GPU.
> Can you do that with something like the following?  I don't know
> anything about DRM, so I don't know where you could save the pm_cap,
> but I'm sure the driver could keep it somewhere.
>

Sure this would work? From a quick look over the pci code, it looks
like a of code would be skipped we really need, like the platform code
to turn off the GPU via ACPI. But I could also remember incorrectly on
how all of that worked again. I can of course try and see what the
effect of this patch would be. And would the parent bus even go into
D3hot if it knows one of its children is still at D0? Because that's
what the result of that would be as well, no? And I know that if the
bus stays in D0, that it has a negative impact on power consumption.

Anyway, I will try that out, I am just not seeing how that would help.

>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index b65ae817eabf..2ad825e8891c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -618,6 +618,23 @@ nouveau_drm_device_fini(struct drm_device *dev)
>         kfree(drm);
>  }
>
> +static void quirk_broken_nv_runpm(struct drm_device *drm_dev)
> +{
> +       struct pci_dev *pdev = drm_dev->pdev;
> +       struct pci_dev *bridge = pci_upstream_bridge(pdev);
> +
> +       if (!bridge || bridge->vendor != PCI_VENDOR_ID_INTEL)
> +               return;
> +
> +       switch (bridge->device) {
> +       case 0x1901:
> +               STASH->pm_cap = pdev->pm_cap;
> +               pdev->pm_cap = 0;
> +               NV_INFO(drm_dev, "Disabling PCI power management to avoid bug\n");
> +               break;
> +       }
> +}
> +
>  static int nouveau_drm_probe(struct pci_dev *pdev,
>                              const struct pci_device_id *pent)
>  {
> @@ -699,6 +716,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>         if (ret)
>                 goto fail_drm_dev_init;
>
> +       quirk_broken_nv_runpm(drm_dev);
>         return 0;
>
>  fail_drm_dev_init:
> @@ -735,6 +753,9 @@ nouveau_drm_remove(struct pci_dev *pdev)
>  {
>         struct drm_device *dev = pci_get_drvdata(pdev);
>
> +       /* If we disabled PCI power management, restore it */
> +       if (STASH->pm_cap)
> +               pdev->pm_cap = STASH->pm_cap;
>         nouveau_drm_device_remove(dev);
>         pci_disable_device(pdev);
>  }
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
