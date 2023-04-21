Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED5A6EB9B3
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 16:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151E710E2B5;
	Sat, 22 Apr 2023 14:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC7D10E05B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:59:03 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-94f109b1808so320476166b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1682096341; x=1684688341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rq5vom0uodnvweUynx3fIZS6vFrF0XZtBCiYV+oEFtU=;
 b=quddO3IRHkx1RXLb24PHVCjfISgyOR7wiTefGLGcZBb+/IOcuzKqA+anxnn7CZWtUW
 RMvmuPg2415xl54uRd0pKov0f2JGHDldAsXFuozGen7EBan994l4/OFS1vgGL3oSAbgW
 M2wwZhIMrzWvZjgk+D1stdCdcFv9UTBrwWgO0cKuX+nvs6o3Zc+BoQO4OQk1xM+06uBE
 Ld7P/D89HSsUR6Oo9P4P5RjWfj/LDn5o/8mIUhnmE05tZ9MkQ9rfCGzXNemR3LKcj7tN
 uYP8wQRIzxjB0e36tbxiv48ovuYySzHCheneRKOt4fcV7+AEHrecdcsNb1FWWiM7EQcq
 Gujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096341; x=1684688341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rq5vom0uodnvweUynx3fIZS6vFrF0XZtBCiYV+oEFtU=;
 b=gFOJHCGxuwTBmdZ/j/g4mJrmtgwTh88x5bAiC0V+msDEG1yZNknsUjqCau+gF3Dpx0
 qqrg5HL3pRl0hxdIhLW197UrLU4+kuXkypLHIMGsMgEt/HZgeRiWielVH/bNoMBfySeU
 nKS+VpYMDxwEEk0g1WuvZA6oq6NX7uEJi1KI5/hwDsLZqZ8tERMQYNZPs8RRWXFj1yE2
 kREyfUAvvZLqSb+3QskOxW3t1IvXIvfDjY3uvlS/4k3Cjcuo7efmL+Mx3pNbMI4dry2q
 CzZ9bbGwJ1PqlDW2qKE7+/S5qdH4IPsSdh60QapRyZAGPbZ3qHuVM09ZKwFShJhBy6kn
 s23w==
X-Gm-Message-State: AAQBX9eV1Ao1jjvTWXIwgMJyEvo2a4rmUsBgCF9za1gah9JHNWPZaiRW
 NJc8nGW/++OdbgnUYcb7rFdC12YAKOfSwG5H5t/C
X-Google-Smtp-Source: AKy350bMvASdbO5W/OQccRZ/cMd3oODjlDnbi1rlYrFr11y7vq+p12TMG2qnAnKv92zI9B6DrLGxsXXu1EPY6nlrUWo=
X-Received: by 2002:a05:6402:889:b0:505:8f4:7412 with SMTP id
 e9-20020a056402088900b0050508f47412mr5198003edy.10.1682096340622; Fri, 21 Apr
 2023 09:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-2-176479fb2fce@freebox.fr>
 <85a999b2-ae13-2ab7-6706-477b9d302efa@xs4all.nl>
In-Reply-To: <85a999b2-ae13-2ab7-6706-477b9d302efa@xs4all.nl>
From: Arnaud Vrac <avrac@freebox.fr>
Date: Fri, 21 Apr 2023 18:58:49 +0200
Message-ID: <CAG9NU68nCE8MQHMrbt2XSqXwgwvBq=rwDP64Om5rckcupD_daw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm: add hdmi cec support
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 22 Apr 2023 14:45:29 +0000
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le ven. 21 avr. 2023 =C3=A0 15:27, Hans Verkuil <hverkuil-cisco@xs4all.nl> =
a =C3=A9crit :
>
> Hi Arnaud,
>
> Some review comments below...

Hi Hans,

For context, I first based my work on the fbdev driver from Qualcomm a
few years ago, on our own CEC framework which does not implement any
CEC protocol logic (as android does). At the time I verified that the
messages were matching the electrical and protocol spec, using manual
tests and a QD882EA analyzer. I also passed HDMI and CEC certs.

I simply ported this work more recently to a newer kernel and the
media-cec framework, also checking the port that Qualcomm did later
on.

> On 4/18/23 20:10, Arnaud Vrac wrote:
> > Some Qualcomm SoCs that support HDMI also support CEC, including MSM899=
6
> > and MSM8998. The hardware block can handle a single CEC logical address
> > and broadcast messages.
> >
> > Port the CEC driver from downstream msm-4.4 kernel. It has been tested
> > on MSM8998 and passes the cec-compliance tool tests.
>
> Just to verify: did you run the cec-compliance --test-adapter test? That'=
s
> the important one to verify your own driver.

Yes, and I also ran the cec-compliance -r 0 with a pulse8 emulating a
tv on the bus. Here's the result of cec-compliance --test-adapter:

Find remote devices:
        Polling: OK

CEC API:
        CEC_ADAP_G_CAPS: OK
        Invalid ioctls: OK
        CEC_DQEVENT: OK
        CEC_ADAP_G/S_PHYS_ADDR: OK
        CEC_ADAP_G/S_LOG_ADDRS: OK
        CEC_TRANSMIT: OK
        CEC_RECEIVE: OK
        CEC_TRANSMIT/RECEIVE (non-blocking): OK (Presumed)
        CEC_G/S_MODE: OK
        warn: cec-test-adapter.cpp(1189): Too many transmits (3)
without receives
                SFTs for repeating messages (>=3D 7): 7: 38, 8: 2
                SFTs for newly transmitted messages (>=3D 5): 6: 2, 7: 17
                SFTs for newly transmitted remote messages (>=3D 5): 6: 20
        CEC_EVENT_LOST_MSGS: OK

Network topology:
[...]

Total for hdmi_msm device /dev/cec0: 11, Succeeded: 11, Failed: 0, Warnings=
: 1

>
> >
> > Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> > ---
> >  drivers/gpu/drm/msm/Kconfig         |   8 ++
> >  drivers/gpu/drm/msm/Makefile        |   1 +
> >  drivers/gpu/drm/msm/hdmi/hdmi.c     |  15 ++
> >  drivers/gpu/drm/msm/hdmi/hdmi.h     |  18 +++
> >  drivers/gpu/drm/msm/hdmi/hdmi_cec.c | 280 ++++++++++++++++++++++++++++=
++++++++
> >  5 files changed, 322 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index 85f5ab1d552c4..2a02c74207935 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -165,3 +165,11 @@ config DRM_MSM_HDMI_HDCP
> >       default y
> >       help
> >         Choose this option to enable HDCP state machine
> > +
> > +config DRM_MSM_HDMI_CEC
> > +     bool "Enable HDMI CEC support in MSM DRM driver"
> > +     depends on DRM_MSM && DRM_MSM_HDMI
> > +     select CEC_CORE
> > +     default y
> > +     help
> > +       Choose this option to enable CEC support
> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefil=
e
> > index 7274c41228ed9..0237a2f219ac2 100644
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@ -131,6 +131,7 @@ msm-$(CONFIG_DRM_MSM_DP)+=3D dp/dp_aux.o \
> >
> >  msm-$(CONFIG_DRM_FBDEV_EMULATION) +=3D msm_fbdev.o
> >
> > +msm-$(CONFIG_DRM_MSM_HDMI_CEC) +=3D hdmi/hdmi_cec.o
> >  msm-$(CONFIG_DRM_MSM_HDMI_HDCP) +=3D hdmi/hdmi_hdcp.o
> >
> >  msm-$(CONFIG_DRM_MSM_DSI) +=3D dsi/dsi.o \
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi=
/hdmi.c
> > index 3132105a2a433..1dde3890e25c0 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > @@ -11,6 +11,8 @@
> >  #include <drm/drm_bridge_connector.h>
> >  #include <drm/drm_of.h>
> >
> > +#include <media/cec.h>
> > +
> >  #include <sound/hdmi-codec.h>
> >  #include "hdmi.h"
> >
> > @@ -53,6 +55,9 @@ static irqreturn_t msm_hdmi_irq(int irq, void *dev_id=
)
> >       if (hdmi->hdcp_ctrl)
> >               msm_hdmi_hdcp_irq(hdmi->hdcp_ctrl);
> >
> > +     /* Process CEC: */
> > +     msm_hdmi_cec_irq(hdmi);
> > +
> >       /* TODO audio.. */
> >
> >       return IRQ_HANDLED;
> > @@ -66,6 +71,8 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
> >        */
> >       if (hdmi->workq)
> >               destroy_workqueue(hdmi->workq);
> > +
> > +     msm_hdmi_cec_exit(hdmi);
> >       msm_hdmi_hdcp_destroy(hdmi);
> >
> >       if (hdmi->i2c)
> > @@ -139,6 +146,8 @@ static int msm_hdmi_init(struct hdmi *hdmi)
> >               hdmi->hdcp_ctrl =3D NULL;
> >       }
> >
> > +     msm_hdmi_cec_init(hdmi);
> > +
> >       return 0;
> >
> >  fail:
> > @@ -198,6 +207,12 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
> >
> >       drm_connector_attach_encoder(hdmi->connector, hdmi->encoder);
> >
> > +     if (hdmi->cec_adap) {
> > +             struct cec_connector_info conn_info;
> > +             cec_fill_conn_info_from_drm(&conn_info, hdmi->connector);
> > +             cec_s_conn_info(hdmi->cec_adap, &conn_info);
> > +     }
> > +
> >       ret =3D devm_request_irq(dev->dev, hdmi->irq,
> >                       msm_hdmi_irq, IRQF_TRIGGER_HIGH,
> >                       "hdmi_isr", hdmi);
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi=
/hdmi.h
> > index e8dbee50637fa..c639bd87f4b8f 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> > @@ -29,6 +29,7 @@ struct hdmi_audio {
> >  };
> >
> >  struct hdmi_hdcp_ctrl;
> > +struct cec_adapter;
> >
> >  struct hdmi {
> >       struct drm_device *dev;
> > @@ -73,6 +74,7 @@ struct hdmi {
> >       struct workqueue_struct *workq;
> >
> >       struct hdmi_hdcp_ctrl *hdcp_ctrl;
> > +     struct cec_adapter *cec_adap;
> >
> >       /*
> >       * spinlock to protect registers shared by different execution
> > @@ -261,4 +263,20 @@ static inline void msm_hdmi_hdcp_off(struct hdmi_h=
dcp_ctrl *hdcp_ctrl) {}
> >  static inline void msm_hdmi_hdcp_irq(struct hdmi_hdcp_ctrl *hdcp_ctrl)=
 {}
> >  #endif
> >
> > +/*
> > + * cec
> > + */
> > +#ifdef CONFIG_DRM_MSM_HDMI_CEC
> > +int msm_hdmi_cec_init(struct hdmi *hdmi);
> > +void msm_hdmi_cec_exit(struct hdmi *hdmi);
> > +void msm_hdmi_cec_irq(struct hdmi *hdmi);
> > +#else
> > +static inline int msm_hdmi_cec_init(struct hdmi *hdmi)
> > +{
> > +     return -ENXIO;
> > +}
> > +static inline void msm_hdmi_cec_exit(struct hdmi *hdmi) {}
> > +static inline void msm_hdmi_cec_irq(struct hdmi *hdmi) {}
> > +#endif
> > +
> >  #endif /* __HDMI_CONNECTOR_H__ */
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_cec.c b/drivers/gpu/drm/msm/=
hdmi/hdmi_cec.c
> > new file mode 100644
> > index 0000000000000..51326e493e5da
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_cec.c
> > @@ -0,0 +1,280 @@
> > +#include <linux/iopoll.h>
> > +#include <media/cec.h>
> > +
> > +#include "hdmi.h"
> > +
> > +#define HDMI_CEC_INT_MASK ( \
> > +     HDMI_CEC_INT_TX_DONE_MASK | \
> > +     HDMI_CEC_INT_TX_ERROR_MASK | \
> > +     HDMI_CEC_INT_RX_DONE_MASK)
> > +
> > +struct hdmi_cec_ctrl {
> > +     struct hdmi *hdmi;
> > +     struct work_struct work;
> > +     spinlock_t lock;
> > +     u32 irq_status;
> > +     u32 tx_status;
> > +     u32 tx_retransmits;
> > +};
> > +
> > +static int msm_hdmi_cec_adap_enable(struct cec_adapter *adap, bool ena=
ble)
> > +{
> > +     struct hdmi_cec_ctrl *cec_ctrl =3D adap->priv;
> > +     struct hdmi *hdmi =3D cec_ctrl->hdmi;
> > +
> > +     if (enable) {
> > +             /* timer frequency, 19.2Mhz * 0.05ms / 1000ms =3D 960 */
> > +             hdmi_write(hdmi, REG_HDMI_CEC_REFTIMER,
> > +                        HDMI_CEC_REFTIMER_REFTIMER(960) |
> > +                        HDMI_CEC_REFTIMER_ENABLE);
> > +
> > +             /* read and write timings */
> > +             hdmi_write(hdmi, REG_HDMI_CEC_RD_RANGE, 0x30AB9888);
> > +             hdmi_write(hdmi, REG_HDMI_CEC_WR_RANGE, 0x888AA888);
> > +             hdmi_write(hdmi, REG_HDMI_CEC_RD_START_RANGE, 0x88888888)=
;
> > +             hdmi_write(hdmi, REG_HDMI_CEC_RD_TOTAL_RANGE, 0x99);
> > +
> > +             /* start bit low pulse duration, 3.7ms */
> > +             hdmi_write(hdmi, REG_HDMI_CEC_RD_ERR_RESP_LO, 74);
> > +
> > +             /* signal free time, 7 * 2.4ms */
> > +             hdmi_write(hdmi, REG_HDMI_CEC_TIME,
> > +                        HDMI_CEC_TIME_SIGNAL_FREE_TIME(7 * 48) |
> > +                        HDMI_CEC_TIME_ENABLE);
>
> The Signal Free Time changes depending on the situation (3, 5 or 7 bit
> periods). Does the hardware take care of that, or do you need to update
> this register in the transmit op as well?

In case of retries, which are handled by the hardware, I'm not sure if
the hardware will use the period set in this register or 3. I believe
it should be 3 otherwise we would have problems when probing addresses
on a busy bus.

Otherwise for new message transmissions, the register value is used
with caveats.

I've just tried to use set the register value during transmit using
the signal_free_time parameter, and am getting wrong results. To
emphasize the problem I set signal_free_time to 3 instead of 5 and 8
instead of 7, and am getting the following in cec-compliance:

                SFTs for repeating messages (>=3D 7): 3: 10, 4: 6, 8: 14, 9=
: 6
                SFTs for newly transmitted messages (>=3D 5): 7: 6, 8: 8

If I instead set signal_free_time to 3 just after receiving a message
and 8 just after sending, I get better results:

                SFTs for repeating messages (>=3D 7): 8: 26, 9: 10
                SFTs for newly transmitted messages (>=3D 5): 2: 7, 3: 12

But it's not clear to me why the change is not effective immediatly in
the first test, so I'm not confortable changing the fixed value of 7
periods.

>
> > +
> > +             hdmi_write(hdmi, REG_HDMI_CEC_COMPL_CTL, 0xF);
> > +             hdmi_write(hdmi, REG_HDMI_CEC_WR_CHECK_CONFIG, 0x4);
> > +             hdmi_write(hdmi, REG_HDMI_CEC_RD_FILTER, BIT(0) | (0x7FF =
<< 4));
> > +
> > +             hdmi_write(hdmi, REG_HDMI_CEC_INT, HDMI_CEC_INT_MASK);
> > +             hdmi_write(hdmi, REG_HDMI_CEC_CTRL, HDMI_CEC_CTRL_ENABLE)=
;
> > +     } else {
> > +             hdmi_write(hdmi, REG_HDMI_CEC_INT, 0);
> > +             hdmi_write(hdmi, REG_HDMI_CEC_CTRL, 0);
> > +             cancel_work_sync(&cec_ctrl->work);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int msm_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log=
ical_addr)
> > +{
> > +     struct hdmi_cec_ctrl *cec_ctrl =3D adap->priv;
> > +     struct hdmi *hdmi =3D cec_ctrl->hdmi;
> > +
> > +     hdmi_write(hdmi, REG_HDMI_CEC_ADDR, logical_addr & 0xF);
>
> So to disable the logical address you set this to 0xf, right? Since
> CEC_LOG_ADDR_INVALID is 0xff.

Right.

>
> > +
> > +     return 0;
> > +}
> > +
> > +static int msm_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 att=
empts,
> > +                                   u32 signal_free_time, struct cec_ms=
g *msg)
>
> Note that the SFT is passed in as an argument for those hardware devices
> that do not keep track of it themselves.
>
> > +{
> > +     struct hdmi_cec_ctrl *cec_ctrl =3D adap->priv;
> > +     struct hdmi *hdmi =3D cec_ctrl->hdmi;
> > +     u8 retransmits;
> > +     u32 broadcast;
> > +     u32 status;
> > +     int i;
> > +
> > +     /* toggle cec in order to flush out bad hw state, if any */
> > +     hdmi_write(hdmi, REG_HDMI_CEC_CTRL, 0);
> > +     hdmi_write(hdmi, REG_HDMI_CEC_CTRL, HDMI_CEC_CTRL_ENABLE);
> > +
> > +     /* flush register writes */
> > +     wmb();
> > +
> > +     retransmits =3D attempts ? (attempts - 1) : 0;
> > +     hdmi_write(hdmi, REG_HDMI_CEC_RETRANSMIT,
> > +                HDMI_CEC_RETRANSMIT_ENABLE |
> > +                HDMI_CEC_RETRANSMIT_COUNT(retransmits));
> > +
> > +     broadcast =3D cec_msg_is_broadcast(msg) ? HDMI_CEC_WR_DATA_BROADC=
AST : 0;
> > +     for (i =3D 0; i < msg->len; i++) {
> > +             hdmi_write(hdmi, REG_HDMI_CEC_WR_DATA,
> > +                        HDMI_CEC_WR_DATA_DATA(msg->msg[i]) | broadcast=
);
> > +     }
> > +
> > +     /* check line status */
> > +     if (read_poll_timeout(hdmi_read, status, !(status & HDMI_CEC_STAT=
US_BUSY),
> > +                           5, 1000, false, hdmi, REG_HDMI_CEC_STATUS))=
 {
> > +             pr_err("CEC line is busy. Retry failed\n");
>
> This doesn't look right. Normally it is the CEC hardware that will wait f=
or the
> bus to become free, and then it will start the transmit. That is not some=
thing
> you should have to do in the driver. And this waits for just 1 ms, right?=
 That's
> much too short if a message is currently being received.
>
> Is there documentation of the CEC hardware available somewhere? Or can yo=
u
> explain a bit about it?

I'm not sure why this code is here, it's a check that was done in the
original Qualcomm driver using a busy loop with a schedule():

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kerne=
l.lnx.4.4.r38-rel/drivers/media/platform/msm/sde/cec/sde_hdmi_cec.c#L174
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kerne=
l.lnx.4.4.r38-rel/drivers/video/fbdev/msm/mdss_hdmi_cec.c#L109

In practice I don't think I've seen the status being busy, but I
ported the check in case it's still useful. Maybe an hw engineer from
Qualcomm can chime in.

>
> > +             return -EBUSY;
> > +     }
> > +
> > +     cec_ctrl->tx_retransmits =3D retransmits;
> > +
> > +     /* start transmission */
> > +     hdmi_write(hdmi, REG_HDMI_CEC_CTRL,
> > +                HDMI_CEC_CTRL_ENABLE |
> > +                HDMI_CEC_CTRL_SEND_TRIGGER |
> > +                HDMI_CEC_CTRL_FRAME_SIZE(msg->len) |
> > +                HDMI_CEC_CTRL_LINE_OE);
> > +
> > +     return 0;
> > +}
> > +
> > +static void msm_hdmi_cec_adap_free(struct cec_adapter *adap)
> > +{
> > +     struct hdmi_cec_ctrl *cec_ctrl =3D adap->priv;
> > +
> > +     cec_ctrl->hdmi->cec_adap =3D NULL;
> > +     kfree(cec_ctrl);
> > +}
> > +
> > +static const struct cec_adap_ops msm_hdmi_cec_adap_ops =3D {
> > +     .adap_enable =3D msm_hdmi_cec_adap_enable,
> > +     .adap_log_addr =3D msm_hdmi_cec_adap_log_addr,
> > +     .adap_transmit =3D msm_hdmi_cec_adap_transmit,
> > +     .adap_free =3D msm_hdmi_cec_adap_free,
> > +};
> > +
> > +#define CEC_IRQ_FRAME_WR_DONE 0x01
> > +#define CEC_IRQ_FRAME_RD_DONE 0x02
> > +
> > +static void msm_hdmi_cec_handle_rx_done(struct hdmi_cec_ctrl *cec_ctrl=
)
> > +{
> > +     struct hdmi *hdmi =3D cec_ctrl->hdmi;
> > +     struct cec_msg msg =3D {};
> > +     u32 data;
> > +     int i;
> > +
> > +     data =3D hdmi_read(hdmi, REG_HDMI_CEC_RD_DATA);
> > +     msg.len =3D (data & 0x1f00) >> 8;
> > +     if (msg.len < 1 || msg.len > CEC_MAX_MSG_SIZE)
> > +             return;
> > +
> > +     msg.msg[0] =3D data & 0xff;
> > +     for (i =3D 1; i < msg.len; i++)
> > +             msg.msg[i] =3D hdmi_read(hdmi, REG_HDMI_CEC_RD_DATA) & 0x=
ff;
> > +
> > +     cec_received_msg(hdmi->cec_adap, &msg);
> > +}
> > +
> > +static void msm_hdmi_cec_handle_tx_done(struct hdmi_cec_ctrl *cec_ctrl=
)
> > +{
> > +     struct hdmi *hdmi =3D cec_ctrl->hdmi;
> > +     u32 tx_status;
> > +
> > +     tx_status =3D (cec_ctrl->tx_status & HDMI_CEC_STATUS_TX_STATUS__M=
ASK) >>
> > +             HDMI_CEC_STATUS_TX_STATUS__SHIFT;
> > +
> > +     switch (tx_status) {
> > +     case 0:
> > +             cec_transmit_done(hdmi->cec_adap,
> > +                               CEC_TX_STATUS_OK, 0, 0, 0, 0);
> > +             break;
> > +     case 1:
> > +             cec_transmit_done(hdmi->cec_adap,
> > +                               CEC_TX_STATUS_NACK, 0, 1, 0, 0);
>
> It's not clear to me who does the retransmits. There are two possibilitie=
s:
> the hardware takes care of that, and so you just get the final result
> and you OR this status with CEC_TX_STATUS_MAX_RETRIES to indicate that
> the CEC framework shouldn't attempt to retry.
>
> Or the hardware just does a single transmit, and in that case you never
> supply the CEC_TX_STATUS_MAX_RETRIES and just leave it up to the framewor=
k
> to reissue a transmit.

After fiddling with the registers, my understanding is the following:

When arbitration loss happens, the hardware returns the ARB_LOSS
status without retrying afterwards, and I don't think the hardware
reports the number of NACKs that were attempted before the arbitration
loss. So in this case I believe it makes sense to only report the
arbitration loss to the framework.

The hardware will otherwise retry up to the number of retransmits
indicated in the REG_HDMI_CEC_RETRANSMIT register set during transmit
and return either OK or MAX_RETRIES (=3DNACK). I haven't seen the NACK
status (case 1) in practice, even if I disable retransmits in the
dedicated register.

>
> So here you do no supply MAX_RETRIES...

I chose to handle case 1 as a single NACK answer, if it could still
happen for some reason.

>
> > +             break;
> > +     case 2:
> > +             cec_transmit_done(hdmi->cec_adap,
> > +                               CEC_TX_STATUS_ARB_LOST, 1, 0, 0, 0);
>
> ... and also not here...

See explanation above.

>
> > +             break;
> > +     case 3:
> > +             cec_transmit_done(hdmi->cec_adap,
> > +                               CEC_TX_STATUS_MAX_RETRIES |
> > +                               CEC_TX_STATUS_NACK,
> > +                               0, cec_ctrl->tx_retransmits + 1, 0, 0);
>
> ...but here you do.

See explanation above.

>
> > +             break;
> > +     default:
> > +             cec_transmit_done(hdmi->cec_adap,
> > +                               CEC_TX_STATUS_ERROR, 0, 0, 0, 1);
> > +             break;
> > +     }
> > +}
> > +
> > +static void msm_hdmi_cec_work(struct work_struct *work)
> > +{
> > +     struct hdmi_cec_ctrl *cec_ctrl =3D
> > +             container_of(work, struct hdmi_cec_ctrl, work);
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&cec_ctrl->lock, flags);

Just a note for myself, I need to avoid calling the cec framework
functions with the spinlock taken.

> > +
> > +     if (cec_ctrl->irq_status & CEC_IRQ_FRAME_WR_DONE)
> > +             msm_hdmi_cec_handle_tx_done(cec_ctrl);
> > +
> > +     if (cec_ctrl->irq_status & CEC_IRQ_FRAME_RD_DONE)
> > +             msm_hdmi_cec_handle_rx_done(cec_ctrl);
> > +
> > +     cec_ctrl->irq_status =3D 0;
> > +     cec_ctrl->tx_status =3D 0;
> > +
> > +     spin_unlock_irqrestore(&cec_ctrl->lock, flags);
> > +}
> > +
> > +void msm_hdmi_cec_irq(struct hdmi *hdmi)
> > +{
> > +     struct hdmi_cec_ctrl *cec_ctrl;
> > +     unsigned long flags;
> > +     u32 int_status;
> > +
> > +     if (!hdmi->cec_adap)
> > +             return;
> > +
> > +     cec_ctrl =3D hdmi->cec_adap->priv;
> > +
> > +     int_status =3D hdmi_read(hdmi, REG_HDMI_CEC_INT);
> > +     if (!(int_status & HDMI_CEC_INT_MASK))
> > +             return;
> > +
> > +     spin_lock_irqsave(&cec_ctrl->lock, flags);
> > +
> > +     if (int_status & (HDMI_CEC_INT_TX_DONE | HDMI_CEC_INT_TX_ERROR)) =
{
> > +             cec_ctrl->tx_status =3D hdmi_read(hdmi, REG_HDMI_CEC_STAT=
US);
> > +             cec_ctrl->irq_status |=3D CEC_IRQ_FRAME_WR_DONE;
> > +     }
> > +
> > +     if (int_status & HDMI_CEC_INT_RX_DONE)
> > +             cec_ctrl->irq_status |=3D CEC_IRQ_FRAME_RD_DONE;
> > +
> > +     spin_unlock_irqrestore(&cec_ctrl->lock, flags);
> > +
> > +     hdmi_write(hdmi, REG_HDMI_CEC_INT, int_status);
> > +     queue_work(hdmi->workq, &cec_ctrl->work);
> > +}
> > +
> > +int msm_hdmi_cec_init(struct hdmi *hdmi)
> > +{
> > +     struct platform_device *pdev =3D hdmi->pdev;
> > +     struct hdmi_cec_ctrl *cec_ctrl;
> > +     struct cec_adapter *cec_adap;
> > +     int ret;
> > +
> > +     cec_ctrl =3D kzalloc(sizeof (*cec_ctrl), GFP_KERNEL);
> > +     if (!cec_ctrl)
> > +             return -ENOMEM;
> > +
> > +     cec_ctrl->hdmi =3D hdmi;
> > +     INIT_WORK(&cec_ctrl->work, msm_hdmi_cec_work);
> > +
> > +     cec_adap =3D cec_allocate_adapter(&msm_hdmi_cec_adap_ops,
> > +                                     cec_ctrl, "msm",
> > +                                     CEC_CAP_DEFAULTS |
> > +                                     CEC_CAP_CONNECTOR_INFO, 1);
> > +     ret =3D PTR_ERR_OR_ZERO(cec_adap);
> > +     if (ret < 0) {
> > +             kfree(cec_ctrl);
> > +             return ret;
> > +     }
> > +
> > +     /* Set the logical address to Unregistered */
> > +     hdmi_write(hdmi, REG_HDMI_CEC_ADDR, 0xf);
> > +
> > +     ret =3D cec_register_adapter(cec_adap, &pdev->dev);
> > +     if (ret < 0) {
> > +             cec_delete_adapter(cec_adap);
> > +             return ret;
> > +     }
> > +
> > +     hdmi->cec_adap =3D cec_adap;
> > +
> > +     return 0;
> > +}
> > +
> > +void msm_hdmi_cec_exit(struct hdmi *hdmi)
> > +{
> > +     cec_unregister_adapter(hdmi->cec_adap);
> > +}
> >
>
> Final question: is this CEC device able to transmit messages when the hot=
plug detect
> pin is low? Some displays pull the HPD low when in Standby, but it is sti=
ll possible
> to wake them up with a <Image View On> message. It is important to check =
that.
>
> If this is really not possible, then the CEC_CAP_NEEDS_HPD should be set.

Yes, messages can be sent with HPD low, as long as the HDMI PLL is up.

Regards,
-Arnaud
