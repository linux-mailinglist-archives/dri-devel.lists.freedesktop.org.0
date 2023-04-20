Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C719C6E8D6E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 11:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C486710E1D1;
	Thu, 20 Apr 2023 09:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19CA10E031
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 09:03:20 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-54fb615ac3dso32557487b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 02:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681981399; x=1684573399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m0lEu5YJQSzQFxLtW0nkX+zXvl36aiYVGcyvCiPixt4=;
 b=Lx01WmClNNLFRpGg+In/O4wEqUkR2lWOznPywlD2hjcxmjZXdVIW3YFG9qZ7Pq4e3Z
 Rgps52rtW/IoGHUlaz7fel1d85Ug67ce5/LGg601cOqvvZiXE/rfkUVSfZ7fMLuqyBPz
 dDX1tHsQdHskJLHgdC9wYMCjoIuHR6qwpBvwsuiDlV2OVabfgT1k00i29DrsbEKLiu/8
 zl0t/QFvlxE8JB3xMD8r9bU6cGxYzy62Gv0mIrsi8vy7s0+ErNX7X2o827HIoea7xeVf
 ESSdUDEYQbC4aDpaY6I/BZxtM7LhoqDU+vBM/PU9EHWrtzOhxBa1YQe6ICEoDt4HkMcl
 dSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681981399; x=1684573399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0lEu5YJQSzQFxLtW0nkX+zXvl36aiYVGcyvCiPixt4=;
 b=bwOicofv3LiLDqArH++QosdnhFrfDx9KojVVth0RtmiA4VG9sLNo+2U2nxxyUuZUuR
 FFGN+V83iX0CrBY9SRIgQ0n35lPRfF6JDHVUD3vSX8trap0IJ1zUSPCPO2KQFFcc8h8P
 U4jhgTTtzRBsDurDSqDPszzhAneQj1VseIwRJBAdYXsWuVF72nHMJ7P80u2jnw3i5aZl
 6eaW1czDyZElOiCmibwAb0yLPOLhmqhc9v0zPvoLiF+1xepGKZALTaFmJuMGLROxqm/M
 a7c3a+6hRHODHbfjQFyP9hR2oerog3KxKs+HU7SGACwoNm/mx6sPsAPS1nLBYXe9Sgax
 ijWw==
X-Gm-Message-State: AAQBX9fucD/ZQa5OV5qblU1mdU1k2zagcreRZ2Qntv4LRc33iDDk2nhN
 zp3Gf29tXeRBScQVeWcOianLxIs04A4zL+7OgjHlTw==
X-Google-Smtp-Source: AKy350ZBGFzJdduxJk5FBk9RHyO91bkq1YawBzCvhgQU8l3ruIDlhnnpA3/WlZoEi7i2+Wl5XbOmMkRi7FOmAWcw8rg=
X-Received: by 2002:a81:4fd0:0:b0:54f:2df2:9907 with SMTP id
 d199-20020a814fd0000000b0054f2df29907mr323563ywb.20.1681981399463; Thu, 20
 Apr 2023 02:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-2-176479fb2fce@freebox.fr>
 <2c2d4ce0-11e7-a0f7-0b24-d8f13b80923f@linaro.org>
 <CAG9NU6-ne+2zZL1WsZv3beVoUdtG5CyMScabwcqzM0d0nnK_vg@mail.gmail.com>
In-Reply-To: <CAG9NU6-ne+2zZL1WsZv3beVoUdtG5CyMScabwcqzM0d0nnK_vg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Apr 2023 12:03:08 +0300
Message-ID: <CAA8EJpqkJ5C-sMwwTLE2RRQQj0U+fLy8eDX+AUPZjzNmJijy=Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm: add hdmi cec support
To: Arnaud Vrac <avrac@freebox.fr>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Sean Paul <sean@poorly.run>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Apr 2023 at 10:24, Arnaud Vrac <avrac@freebox.fr> wrote:
>
> Le jeu. 20 avr. 2023 =C3=A0 02:20, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> a =C3=A9crit :
> >
> > On 18/04/2023 21:10, Arnaud Vrac wrote:
> > > Some Qualcomm SoCs that support HDMI also support CEC, including MSM8=
996
> > > and MSM8998. The hardware block can handle a single CEC logical addre=
ss
> > > and broadcast messages.
> > >
> > > Port the CEC driver from downstream msm-4.4 kernel. It has been teste=
d
> > > on MSM8998 and passes the cec-compliance tool tests.
> > >
> > > Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> > > ---
> > >   drivers/gpu/drm/msm/Kconfig         |   8 ++
> > >   drivers/gpu/drm/msm/Makefile        |   1 +
> > >   drivers/gpu/drm/msm/hdmi/hdmi.c     |  15 ++
> > >   drivers/gpu/drm/msm/hdmi/hdmi.h     |  18 +++
> > >   drivers/gpu/drm/msm/hdmi/hdmi_cec.c | 280 +++++++++++++++++++++++++=
+++++++++++
> > >   5 files changed, 322 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfi=
g
> > > index 85f5ab1d552c4..2a02c74207935 100644
> > > --- a/drivers/gpu/drm/msm/Kconfig
> > > +++ b/drivers/gpu/drm/msm/Kconfig
> > > @@ -165,3 +165,11 @@ config DRM_MSM_HDMI_HDCP
> > >       default y
> > >       help
> > >         Choose this option to enable HDCP state machine
> > > +
> > > +config DRM_MSM_HDMI_CEC
> > > +     bool "Enable HDMI CEC support in MSM DRM driver"
> > > +     depends on DRM_MSM && DRM_MSM_HDMI
> > > +     select CEC_CORE
> > > +     default y
> > > +     help
> > > +       Choose this option to enable CEC support
> > > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makef=
ile
> > > index 7274c41228ed9..0237a2f219ac2 100644
> > > --- a/drivers/gpu/drm/msm/Makefile
> > > +++ b/drivers/gpu/drm/msm/Makefile
> > > @@ -131,6 +131,7 @@ msm-$(CONFIG_DRM_MSM_DP)+=3D dp/dp_aux.o \
> > >
> > >   msm-$(CONFIG_DRM_FBDEV_EMULATION) +=3D msm_fbdev.o
> > >
> > > +msm-$(CONFIG_DRM_MSM_HDMI_CEC) +=3D hdmi/hdmi_cec.o
> > >   msm-$(CONFIG_DRM_MSM_HDMI_HDCP) +=3D hdmi/hdmi_hdcp.o
> > >
> > >   msm-$(CONFIG_DRM_MSM_DSI) +=3D dsi/dsi.o \
> > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hd=
mi/hdmi.c
> > > index 3132105a2a433..1dde3890e25c0 100644
> > > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > > @@ -11,6 +11,8 @@
> > >   #include <drm/drm_bridge_connector.h>
> > >   #include <drm/drm_of.h>
> > >
> > > +#include <media/cec.h>
> > > +
> > >   #include <sound/hdmi-codec.h>
> > >   #include "hdmi.h"
> > >
> > > @@ -53,6 +55,9 @@ static irqreturn_t msm_hdmi_irq(int irq, void *dev_=
id)
> > >       if (hdmi->hdcp_ctrl)
> > >               msm_hdmi_hdcp_irq(hdmi->hdcp_ctrl);
> > >
> > > +     /* Process CEC: */
> > > +     msm_hdmi_cec_irq(hdmi);
> > > +
> > >       /* TODO audio.. */
> > >
> > >       return IRQ_HANDLED;
> > > @@ -66,6 +71,8 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
> > >        */
> > >       if (hdmi->workq)
> > >               destroy_workqueue(hdmi->workq);
> > > +
> > > +     msm_hdmi_cec_exit(hdmi);
> > >       msm_hdmi_hdcp_destroy(hdmi);
> > >
> > >       if (hdmi->i2c)
> > > @@ -139,6 +146,8 @@ static int msm_hdmi_init(struct hdmi *hdmi)
> > >               hdmi->hdcp_ctrl =3D NULL;
> > >       }
> > >
> > > +     msm_hdmi_cec_init(hdmi);
> > > +
> > >       return 0;
> > >
> > >   fail:
> > > @@ -198,6 +207,12 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
> > >
> > >       drm_connector_attach_encoder(hdmi->connector, hdmi->encoder);
> > >
> > > +     if (hdmi->cec_adap) {
> > > +             struct cec_connector_info conn_info;
> > > +             cec_fill_conn_info_from_drm(&conn_info, hdmi->connector=
);
> > > +             cec_s_conn_info(hdmi->cec_adap, &conn_info);
> > > +     }
> > > +
> > >       ret =3D devm_request_irq(dev->dev, hdmi->irq,
> > >                       msm_hdmi_irq, IRQF_TRIGGER_HIGH,
> > >                       "hdmi_isr", hdmi);
> > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hd=
mi/hdmi.h
> > > index e8dbee50637fa..c639bd87f4b8f 100644
> > > --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> > > @@ -29,6 +29,7 @@ struct hdmi_audio {
> > >   };
> > >
> > >   struct hdmi_hdcp_ctrl;
> > > +struct cec_adapter;
> > >
> > >   struct hdmi {
> > >       struct drm_device *dev;
> > > @@ -73,6 +74,7 @@ struct hdmi {
> > >       struct workqueue_struct *workq;
> > >
> > >       struct hdmi_hdcp_ctrl *hdcp_ctrl;
> > > +     struct cec_adapter *cec_adap;
> > >
> > >       /*
> > >       * spinlock to protect registers shared by different execution
> > > @@ -261,4 +263,20 @@ static inline void msm_hdmi_hdcp_off(struct hdmi=
_hdcp_ctrl *hdcp_ctrl) {}
> > >   static inline void msm_hdmi_hdcp_irq(struct hdmi_hdcp_ctrl *hdcp_ct=
rl) {}
> > >   #endif
> > >
> > > +/*
> > > + * cec
> > > + */
> > > +#ifdef CONFIG_DRM_MSM_HDMI_CEC
> > > +int msm_hdmi_cec_init(struct hdmi *hdmi);
> > > +void msm_hdmi_cec_exit(struct hdmi *hdmi);
> > > +void msm_hdmi_cec_irq(struct hdmi *hdmi);
> > > +#else
> > > +static inline int msm_hdmi_cec_init(struct hdmi *hdmi)
> > > +{
> > > +     return -ENXIO;
> > > +}
> > > +static inline void msm_hdmi_cec_exit(struct hdmi *hdmi) {}
> > > +static inline void msm_hdmi_cec_irq(struct hdmi *hdmi) {}
> > > +#endif
> > > +
> > >   #endif /* __HDMI_CONNECTOR_H__ */
> > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_cec.c b/drivers/gpu/drm/ms=
m/hdmi/hdmi_cec.c
> > > new file mode 100644
> > > index 0000000000000..51326e493e5da
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_cec.c
> > > @@ -0,0 +1,280 @@
> > > +#include <linux/iopoll.h>
> > > +#include <media/cec.h>
> > > +
> > > +#include "hdmi.h"
> > > +
> > > +#define HDMI_CEC_INT_MASK ( \
> > > +     HDMI_CEC_INT_TX_DONE_MASK | \
> > > +     HDMI_CEC_INT_TX_ERROR_MASK | \
> > > +     HDMI_CEC_INT_RX_DONE_MASK)
> > > +
> > > +struct hdmi_cec_ctrl {
> > > +     struct hdmi *hdmi;
> > > +     struct work_struct work;
> > > +     spinlock_t lock;
> > > +     u32 irq_status;
> > > +     u32 tx_status;
> > > +     u32 tx_retransmits;
> > > +};
> > > +
> > > +static int msm_hdmi_cec_adap_enable(struct cec_adapter *adap, bool e=
nable)
> > > +{
> > > +     struct hdmi_cec_ctrl *cec_ctrl =3D adap->priv;
> > > +     struct hdmi *hdmi =3D cec_ctrl->hdmi;
> > > +
> > > +     if (enable) {
> > > +             /* timer frequency, 19.2Mhz * 0.05ms / 1000ms =3D 960 *=
/
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_REFTIMER,
> > > +                        HDMI_CEC_REFTIMER_REFTIMER(960) |
> > > +                        HDMI_CEC_REFTIMER_ENABLE);
> > > +
> > > +             /* read and write timings */
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_RD_RANGE, 0x30AB9888);
> >
> > lowercase hex please. We are trying to switch to it.
> >
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_WR_RANGE, 0x888AA888);
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_RD_START_RANGE, 0x8888888=
8);
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_RD_TOTAL_RANGE, 0x99);
> > > +
> > > +             /* start bit low pulse duration, 3.7ms */
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_RD_ERR_RESP_LO, 74);
> > > +
> > > +             /* signal free time, 7 * 2.4ms */
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_TIME,
> > > +                        HDMI_CEC_TIME_SIGNAL_FREE_TIME(7 * 48) |
> > > +                        HDMI_CEC_TIME_ENABLE);
> > > +
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_COMPL_CTL, 0xF);
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_WR_CHECK_CONFIG, 0x4);
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_RD_FILTER, BIT(0) | (0x7F=
F << 4));
> > > +
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_INT, HDMI_CEC_INT_MASK);
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_CTRL, HDMI_CEC_CTRL_ENABL=
E);
> > > +     } else {
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_INT, 0);
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_CTRL, 0);
> > > +             cancel_work_sync(&cec_ctrl->work);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int msm_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 l=
ogical_addr)
> > > +{
> > > +     struct hdmi_cec_ctrl *cec_ctrl =3D adap->priv;
> > > +     struct hdmi *hdmi =3D cec_ctrl->hdmi;
> > > +
> > > +     hdmi_write(hdmi, REG_HDMI_CEC_ADDR, logical_addr & 0xF);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int msm_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 a=
ttempts,
> > > +                                   u32 signal_free_time, struct cec_=
msg *msg)
> > > +{
> > > +     struct hdmi_cec_ctrl *cec_ctrl =3D adap->priv;
> > > +     struct hdmi *hdmi =3D cec_ctrl->hdmi;
> > > +     u8 retransmits;
> > > +     u32 broadcast;
> > > +     u32 status;
> > > +     int i;
> > > +
> > > +     /* toggle cec in order to flush out bad hw state, if any */
> > > +     hdmi_write(hdmi, REG_HDMI_CEC_CTRL, 0);
> > > +     hdmi_write(hdmi, REG_HDMI_CEC_CTRL, HDMI_CEC_CTRL_ENABLE);
> > > +
> > > +     /* flush register writes */
> > > +     wmb();
> > > +
> > > +     retransmits =3D attempts ? (attempts - 1) : 0;
> > > +     hdmi_write(hdmi, REG_HDMI_CEC_RETRANSMIT,
> > > +                HDMI_CEC_RETRANSMIT_ENABLE |
> > > +                HDMI_CEC_RETRANSMIT_COUNT(retransmits));
> > > +
> > > +     broadcast =3D cec_msg_is_broadcast(msg) ? HDMI_CEC_WR_DATA_BROA=
DCAST : 0;
> > > +     for (i =3D 0; i < msg->len; i++) {
> > > +             hdmi_write(hdmi, REG_HDMI_CEC_WR_DATA,
> > > +                        HDMI_CEC_WR_DATA_DATA(msg->msg[i]) | broadca=
st);
> > > +     }
> > > +
> > > +     /* check line status */
> > > +     if (read_poll_timeout(hdmi_read, status, !(status & HDMI_CEC_ST=
ATUS_BUSY),
> > > +                           5, 1000, false, hdmi, REG_HDMI_CEC_STATUS=
)) {
> > > +             pr_err("CEC line is busy. Retry failed\n");
> > > +             return -EBUSY;
> > > +     }
> > > +
> > > +     cec_ctrl->tx_retransmits =3D retransmits;
> > > +
> > > +     /* start transmission */
> > > +     hdmi_write(hdmi, REG_HDMI_CEC_CTRL,
> > > +                HDMI_CEC_CTRL_ENABLE |
> > > +                HDMI_CEC_CTRL_SEND_TRIGGER |
> > > +                HDMI_CEC_CTRL_FRAME_SIZE(msg->len) |
> > > +                HDMI_CEC_CTRL_LINE_OE);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void msm_hdmi_cec_adap_free(struct cec_adapter *adap)
> > > +{
> > > +     struct hdmi_cec_ctrl *cec_ctrl =3D adap->priv;
> > > +
> > > +     cec_ctrl->hdmi->cec_adap =3D NULL;
> > > +     kfree(cec_ctrl);
> > > +}
> > > +
> > > +static const struct cec_adap_ops msm_hdmi_cec_adap_ops =3D {
> > > +     .adap_enable =3D msm_hdmi_cec_adap_enable,
> > > +     .adap_log_addr =3D msm_hdmi_cec_adap_log_addr,
> > > +     .adap_transmit =3D msm_hdmi_cec_adap_transmit,
> > > +     .adap_free =3D msm_hdmi_cec_adap_free,
> > > +};
> > > +
> > > +#define CEC_IRQ_FRAME_WR_DONE 0x01
> > > +#define CEC_IRQ_FRAME_RD_DONE 0x02
> >
> > Please move these to top. Also you might consider replacing this mask
> > with two boolean flags.
> >
> > > +
> > > +static void msm_hdmi_cec_handle_rx_done(struct hdmi_cec_ctrl *cec_ct=
rl)
> > > +{
> > > +     struct hdmi *hdmi =3D cec_ctrl->hdmi;
> > > +     struct cec_msg msg =3D {};
> > > +     u32 data;
> > > +     int i;
> > > +
> > > +     data =3D hdmi_read(hdmi, REG_HDMI_CEC_RD_DATA);
> > > +     msg.len =3D (data & 0x1f00) >> 8;
> >
> > We can also use FIELD_GET here. I'll add defines to the mesa merge requ=
est.
>
> Ok, I wasn't sure if it made sense to add the bitfield definition for
> this since it's only valid for the first byte of the message. I'll add
> the change since this has been integrated into mesa.
>
> >
> > > +     if (msg.len < 1 || msg.len > CEC_MAX_MSG_SIZE)
> > > +             return;
> > > +
> > > +     msg.msg[0] =3D data & 0xff;
> > > +     for (i =3D 1; i < msg.len; i++)
> > > +             msg.msg[i] =3D hdmi_read(hdmi, REG_HDMI_CEC_RD_DATA) & =
0xff;
> > > +
> > > +     cec_received_msg(hdmi->cec_adap, &msg);
> > > +}
> > > +
> > > +static void msm_hdmi_cec_handle_tx_done(struct hdmi_cec_ctrl *cec_ct=
rl)
> > > +{
> > > +     struct hdmi *hdmi =3D cec_ctrl->hdmi;
> > > +     u32 tx_status;
> > > +
> > > +     tx_status =3D (cec_ctrl->tx_status & HDMI_CEC_STATUS_TX_STATUS_=
_MASK) >>
> > > +             HDMI_CEC_STATUS_TX_STATUS__SHIFT;
> >
> > FIELD_GET(HDMI_CEC_STATUS_TX_STATUS__MASK, cec_ctrl->tx_status).
> >
> > > +
> > > +     switch (tx_status) {
> > > +     case 0:
> >
> > Please use valus from enum hdmi_cec_tx_status
> >
> > > +             cec_transmit_done(hdmi->cec_adap,
> > > +                               CEC_TX_STATUS_OK, 0, 0, 0, 0);
> > > +             break;
> > > +     case 1:
> > > +             cec_transmit_done(hdmi->cec_adap,
> > > +                               CEC_TX_STATUS_NACK, 0, 1, 0, 0);
> > > +             break;
> > > +     case 2:
> > > +             cec_transmit_done(hdmi->cec_adap,
> > > +                               CEC_TX_STATUS_ARB_LOST, 1, 0, 0, 0);
> > > +             break;
> > > +     case 3:
> > > +             cec_transmit_done(hdmi->cec_adap,
> > > +                               CEC_TX_STATUS_MAX_RETRIES |
> > > +                               CEC_TX_STATUS_NACK,
> > > +                               0, cec_ctrl->tx_retransmits + 1, 0, 0=
);
> > > +             break;
> > > +     default:
> > > +             cec_transmit_done(hdmi->cec_adap,
> > > +                               CEC_TX_STATUS_ERROR, 0, 0, 0, 1);
> > > +             break;
> > > +     }
> > > +}
> > > +
> > > +static void msm_hdmi_cec_work(struct work_struct *work)
> > > +{
> > > +     struct hdmi_cec_ctrl *cec_ctrl =3D
> > > +             container_of(work, struct hdmi_cec_ctrl, work);
> > > +     unsigned long flags;
> > > +
> > > +     spin_lock_irqsave(&cec_ctrl->lock, flags);
> > > +
> > > +     if (cec_ctrl->irq_status & CEC_IRQ_FRAME_WR_DONE)
> > > +             msm_hdmi_cec_handle_tx_done(cec_ctrl);
> > > +
> > > +     if (cec_ctrl->irq_status & CEC_IRQ_FRAME_RD_DONE)
> > > +             msm_hdmi_cec_handle_rx_done(cec_ctrl);
> > > +
> > > +     cec_ctrl->irq_status =3D 0;
> > > +     cec_ctrl->tx_status =3D 0;
> > > +
> > > +     spin_unlock_irqrestore(&cec_ctrl->lock, flags);
> > > +}
> > > +
> > > +void msm_hdmi_cec_irq(struct hdmi *hdmi)
> > > +{
> > > +     struct hdmi_cec_ctrl *cec_ctrl;
> > > +     unsigned long flags;
> > > +     u32 int_status;
> > > +
> > > +     if (!hdmi->cec_adap)
> > > +             return;
> > > +
> > > +     cec_ctrl =3D hdmi->cec_adap->priv;
> > > +
> > > +     int_status =3D hdmi_read(hdmi, REG_HDMI_CEC_INT);
> > > +     if (!(int_status & HDMI_CEC_INT_MASK))
> > > +             return;
> > > +
> > > +     spin_lock_irqsave(&cec_ctrl->lock, flags);
> > > +
> > > +     if (int_status & (HDMI_CEC_INT_TX_DONE | HDMI_CEC_INT_TX_ERROR)=
) {
> > > +             cec_ctrl->tx_status =3D hdmi_read(hdmi, REG_HDMI_CEC_ST=
ATUS);
> > > +             cec_ctrl->irq_status |=3D CEC_IRQ_FRAME_WR_DONE;
> > > +     }
> > > +
> > > +     if (int_status & HDMI_CEC_INT_RX_DONE)
> > > +             cec_ctrl->irq_status |=3D CEC_IRQ_FRAME_RD_DONE;
> > > +
> > > +     spin_unlock_irqrestore(&cec_ctrl->lock, flags);
> > > +
> > > +     hdmi_write(hdmi, REG_HDMI_CEC_INT, int_status);
> > > +     queue_work(hdmi->workq, &cec_ctrl->work);
> > > +}
> > > +
> > > +int msm_hdmi_cec_init(struct hdmi *hdmi)
> > > +{
> > > +     struct platform_device *pdev =3D hdmi->pdev;
> > > +     struct hdmi_cec_ctrl *cec_ctrl;
> > > +     struct cec_adapter *cec_adap;
> > > +     int ret;
> >
> > hdmi_cec_enable from msm-4.4 tells that CEC is not supported if
> > REG_HDMI_VERSION reads < 0x30000001. Could you please add this check?
>
> Ack. I wonder which SoCs before MSM8996 can actually support CEC.

Granted the commit at [1], one can assume that apq8084 supported CEC
and it even wasn't the first one.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/commit/8d8640d18491=
660f8c6bd082fd2030e2d7cbc1f8

I checked, on apq8064 this register reads as  0x2010000. I'd guess the
first chips to support CEC were msm8974/apq8074

>
> >
> >
> >
> >
> > > +
> > > +     cec_ctrl =3D kzalloc(sizeof (*cec_ctrl), GFP_KERNEL);
> > > +     if (!cec_ctrl)
> > > +             return -ENOMEM;
> > > +
> > > +     cec_ctrl->hdmi =3D hdmi;
> > > +     INIT_WORK(&cec_ctrl->work, msm_hdmi_cec_work);
> > > +
> > > +     cec_adap =3D cec_allocate_adapter(&msm_hdmi_cec_adap_ops,
> > > +                                     cec_ctrl, "msm",
> > > +                                     CEC_CAP_DEFAULTS |
> > > +                                     CEC_CAP_CONNECTOR_INFO, 1);
> > > +     ret =3D PTR_ERR_OR_ZERO(cec_adap);
> > > +     if (ret < 0) {
> > > +             kfree(cec_ctrl);
> > > +             return ret;
> > > +     }
> > > +
> > > +     /* Set the logical address to Unregistered */
> > > +     hdmi_write(hdmi, REG_HDMI_CEC_ADDR, 0xf);
> > > +
> > > +     ret =3D cec_register_adapter(cec_adap, &pdev->dev);
> > > +     if (ret < 0) {
> > > +             cec_delete_adapter(cec_adap);
> > > +             return ret;
> > > +     }
> > > +
> > > +     hdmi->cec_adap =3D cec_adap;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +void msm_hdmi_cec_exit(struct hdmi *hdmi)
> > > +{
> > > +     cec_unregister_adapter(hdmi->cec_adap);
> > > +}



--=20
With best wishes
Dmitry
